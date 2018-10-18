class ShopsController < ApplicationController
  include Search
  include SetCoupon
  include SetCart
  before_action :set_coupon, :set_cart

  def index
    @shops = []
    # アルファベットで始まるショップの検索
    ("A".."Z").each do |initial|
      @shops << Shop.where("name LIKE(?)", "#{initial}%").includes(:items)
    end
  end

  def show
    @shop = Shop.find(params[:id])
    @items = @shop.items
    @top_categories = TopCategory.all

    # itemの絞り込み
    url = request.path_info
    @items = search_items_by_gender(url, @items)

    if user_signed_in?
      # チェックしたショップ機能
      current_user.checked_shops.where(shop_id: @shop.id).first_or_create.update(updated_at: Time.current)
    end

    # 色によるアイテムの絞り込み
    if params[:color]
      @items = search_items_by_color(@items, params[:color])
    end

    # クーポン機能
    if Coupon.exists?
      @coupon = Coupon.first
      @coupon_shops = Coupon.all.includes(:shop).map{|coupon| coupon.shop}
    end
  end
end
