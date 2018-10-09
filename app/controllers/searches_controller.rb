class SearchesController < ApplicationController

  def index
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    @shops = Shop.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    @top_categories = TopCategory.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    @sub_categories = SubCategory.where('name LIKE(?)', "%#{params[:keyword]}%").limit(10)
    @searches = @brands + @shops + @items + @top_categories + @sub_categories

    respond_to do |format|
      format.html
      format.json
    end
    # redirect_to :controller => 'tops', :action => 'index'
  end

end
