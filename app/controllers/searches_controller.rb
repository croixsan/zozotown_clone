class SearchesController < ApplicationController
  include SetCoupon
  include SetCart
  before_action :set_coupon, :set_cart

  def index
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%").order('id').limit(3)
    @shops = Shop.where('name LIKE(?)', "%#{params[:keyword]}%").order('id').limit(3)
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").order('id').limit(3)
    @top_categories = TopCategory.where('name LIKE(?)', "%#{params[:keyword]}%").order('id').limit(3)
    @sub_categories = SubCategory.where('name LIKE(?)', "%#{params[:keyword]}%").order('id').limit(3)
    @searches = @brands + @shops + @items + @top_categories + @sub_categories

    respond_to do |format|
      format.html
      format.json
    end
    # redirect_to :controller => 'tops', :action => 'index'
  end

  def result
    @top_categories = TopCategory.all
    @keyword = params[:keyword]
    if items = Item.where("name Like(?)", "%#{@keyword}%").includes(:images)
      @items = items
    end

    if brand = Brand.find_by(name: @keyword)
      @items = brand.items
    end

    if shop = Shop.find_by(name: @keyword)
      @items = shop.items
    end

    if top_category = TopCategory.find_by(name: @keyword)
      @items = top_category.items
    end

    if sub_category = SubCategory.find_by(name: @keyword)
      @items = sub_category.items
    end
  end
end
