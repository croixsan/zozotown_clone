class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @pre_order = current_user.pre_order
    @cart = current_user.cart
    @item_nums = current_user.cart.item_nums.group(:number)
    @counts = @item_nums.count
    # 商品合計金額、送料、手数料から最終金額を算出
    @total_price = @cart.total_price + @pre_order.delivery.price + @pre_order.payment.price

    # 利用可能なクーポンの算出（アイテムに１つでもクーポン対象商品が含まれていれば、クーポン利用可能とする）
    @coupon = 0
    @cart.items.each do |item|
      if @coupon = item.shop.coupon
        break;
      end
    end
    @discount_point = current_user.point
    if @coupon
      @discount_point += @coupon.price
      @total_price -= @coupon.price
    end
  end

  def create
    ActiveRecord::Base.transaction do
      pre_order = current_user.pre_order
      coupon = order_params[:coupon].to_i
      @order = current_user.orders.create!(
        delivery_id: pre_order.delivery_id,
        payment_id: pre_order.payment_id,
        delivery_day: pre_order.hope_day,
        delivery_hour: pre_order.hope_hour,
        used_point: order_params[:used_point],
        coupon: coupon,
        order_num: "#{current_user.id}_#{pre_order.id}",
        total_price: current_user.cart.total_price + pre_order.delivery.price + pre_order.payment.price - order_params[:used_point].to_i - coupon)
      # 中間テーブルにアイテムを登録
      item_nums = current_user.cart.item_nums.group(:number)
      count = item_nums.count # 購入したアイテムの個数を算出
      item_nums.each do |item_num|
        ordered_item = OrderedItem.new
        ordered_item.item_id = item_num.item.id
        ordered_item.item_num_id = item_num.id
        ordered_item.order_id = @order.id
        ordered_item.number = count[item_num.number]
        ordered_item.save!

        # 在庫の削除
        stock = item_num.stock.stock
        if stock > 0
          item_num.stock.update(stock: stock - 1)
        end
      end

      # pre_orderの削除
      pre_order.destroy

      # カート内のアイテムの削除
      current_user.cart.shoppings.destroy_all

      #ポイントの削除
      point = current_user.point - order_params[:used_point].to_i
      current_user.update!(point: point)

      # 以前カートに入れたアイテムから削除
      current_user.past_carts.where(item_num_id: item_nums.ids).destroy_all

    end
      redirect_to order_path(@order)
    rescue ActiveRecord::RecordInvalid
      redirect_to action: :new
  end

  def show
    @order = Order.find(params[:id])
    @item_nums = @order.item_nums
  end

  private
  def order_params
    params.require(:order).permit(:coupon, :used_point)
  end
end
