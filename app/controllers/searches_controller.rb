class SearchesController < ApplicationController

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
  end

  def show
    @top_category = TopCategory.find(51)
    @items = Item.all
    @sub_categories = SubCategory.all
  end

end
