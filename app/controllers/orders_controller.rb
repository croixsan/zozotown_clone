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
end
