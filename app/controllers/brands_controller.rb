class BrandsController < ApplicationController
  include Search
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
  end
end
