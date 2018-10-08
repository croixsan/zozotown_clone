class SearchesController < ApplicationController

  def index
    @brands = Brand.where('title LIKE(?)', "a").limit(20)
    respond_to do |format|
      format.html
      format.json
    end
  end

end
