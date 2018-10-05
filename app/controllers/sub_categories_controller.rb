class SubCategoriesController < ApplicationController
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
  end
end
