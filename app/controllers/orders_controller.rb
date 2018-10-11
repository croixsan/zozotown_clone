class OrdersController < ApplicationController
  before_action :setup_user
  def index
    @pre_order = current_user.pre_order
    @cart = current_user.cart
    @item_nums = current_user.cart.item_nums.group(:number)
    @counts = @item_nums.count
    # 商品合計金額、送料、手数料から最終金額を算出
    @total_price = @cart.total_price + @pre_order.delivery.price + @pre_order.payment.price

    # 利用可能なクーポンの算出（アイテムに１つでもクーポン対象商品が含まれていれば、クーポン利用可能とする）
    @coupon = 0
    @cart.items.each do |item|
      if item.coupon.price > 0
        @coupon = item.coupon.price
        break
      end
    end
    @discount_point = current_user.point + @coupon
  end

  def select
    @order = Order.new
    @delivery = Delivery.new
    @card = Card.new

    # @addless = Delivery.where(user_id: current_user.id)
    @itemprice = 5500
    @totalprice = 5700
  end

  def registration
        binding pry

    @delivery = Delivery.create(delivery_params)
    @order = Order.create(order_params)
    @card = Card.new(card_params)
    @card.save


    # @order.delivery.build
    # @card = @order.card.build
    # @card = Card.new
    # @card.create(card_params)
    # @cart = Cart.

    # binding.pry
    # @derivery = Delivery.new
    # @delivery.create
    # @orders = Order.new
    # @orders.create

    redirect_to orders_select_path
  end

  private

    def order_params
      params.require(:order).permit(
        :delivery_kind,
        :delivery_day,
        :delivery_hour
        ).merge(cart_id: current_user.cart.id, user_id: current_user.id, delivery_id: @delivery.id)
    end
    # :delivery_hour, :cart_id, deliveries_attributes: [:user_id, :addless, :post_num, :kind, :name]
    # cards_attributes: [:user_id, :name, :number, :limit_year, :limit_month, :security_code, :payment_num]
    def card_params
      params.require(:order).permit(:name, :number, :limit_year, :limit_month, :payment_num).merge(user_id: current_user.id, security_code: current_user.id, )
    end
   def delivery_params
      params.require(:order).permit(delivery: [:addless, :post_num, :phone_num, :kind, :name]).merge(user_id: current_user.id)
    end

    def setup_user
      @user = User.find(current_user.id)
    end
end
