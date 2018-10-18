class SubCategoriesController < ApplicationController
  include Search
  include SetCoupon
  include SetCart
  before_action :set_coupon, :set_cart

  def show
    @sub_category = SubCategory.find(params[:id])
    @top_category = @sub_category.top_category
    @sub_categories = @top_category.sub_categories
    @items = @sub_category.items.includes(:images)

    # itemの絞り込み
    url = request.path_info
    @items = search_items_by_gender(url, @items)
    @items = search_items_by_brand(url, @items)
    @items = search_items_by_shop(url, @items)

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
