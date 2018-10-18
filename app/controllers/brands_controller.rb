class BrandsController < ApplicationController
  include Search
  include SetCoupon
  before_action :set_coupon

  def index
    @brands = []
    # アルファベットで始まるショップの検索
    ("A".."Z").each do |initial|
      @brands << Brand.where("name LIKE(?)", "#{initial}%").includes(:items)
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @items = @brand.items
    @top_categories = TopCategory.all

    # itemの絞り込み
    url = request.path_info
    @items = search_items_by_gender(url, @items)

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
