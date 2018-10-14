class CouponsController < ApplicationController
  $coupon_price
  $coupon_shops = []

  def index
    @coupon = Coupon.find_by(price: $coupon_price)
    @items = Item.where(coupon_id: @coupon.id).includes(:images).order("created_at DESC")
    @top_categories = TopCategory.all.includes(:sub_categories)
  end

  def new
    @coupon = Coupon.new
    @shops = Shop.where("items_count > ?", 5).includes(:items)
  end

  def create
    # 現在のクーポン対象ショップのアイテムを0に設定
    if $coupon_shops
      $coupon_shops.each do |shop|
        shop.items.update(coupon_id: Coupon.find_by(price: 0).id)
      end
    end
    $coupon_shops.clear()

    # 「現在のクーポン」の更新
    $coupon_price = coupon_params[:price].to_i

    # 選択したショップのアイテムをクーポン対象商品に設定
    coupon = Coupon.find_by(price: coupon_params[:price].to_i)
    shop_ids = coupon_params[:shop_ids]
    shop_ids.each do |shop_id|
      shop = Shop.find(shop_id)
      shop.items.update(coupon_id: coupon.id)
      $coupon_shops << shop
    end

    redirect_to root_path
  end

  private
  def coupon_params
      params.require(:coupon).permit(:price).merge(params.require(:shop).permit(shop_ids: []))
  end
end
