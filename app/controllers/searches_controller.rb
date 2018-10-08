class SearchesController < ApplicationController

  def index
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
    # redirect_to :controller => 'tops', :action => 'index'
  end

end
