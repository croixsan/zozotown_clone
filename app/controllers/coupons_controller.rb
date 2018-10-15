class CouponsController < ApplicationController
  def index
    @coupon = Coupon.first
    # クーポン機能
    if Coupon.exists?
      @coupon = Coupon.first
      @coupon_shops = Coupon.all.includes(:shop).map{|coupon| coupon.shop}
      @items = @coupon_shops.map{|shop| shop.items}
      @items = @items.flatten
    end
    @top_categories = TopCategory.all.includes(:sub_categories)
  end

  def new
    @coupon = Coupon.new
    @shops = Shop.where("items_count > ?", 5).includes(:items)
  end

  def create
    # 現在のクーポン情報方を削除
    Coupon.delete_all

    # クーポン対象となるショップを登録
    coupon_params[:shop_ids].each do |shop_id|
      Coupon.create(shop_id: shop_id.to_i, price: coupon_params[:price].to_i)
    end

    redirect_to root_path
  end

  private
  def coupon_params
      params.require(:coupon).permit(:price).merge(params.require(:shop).permit(shop_ids: []))
  end
end
