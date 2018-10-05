class ShopsController < ApplicationController
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
  end
end
