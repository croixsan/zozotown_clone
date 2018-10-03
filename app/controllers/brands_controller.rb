class BrandsController < ApplicationController
  def index
    @brands = []
    # アルファベットで始まるショップの検索
    ("A".."Z").each do |initial|
      @brands << Brand.where("name LIKE(?)", "#{initial}%").includes(:items)
    end
  end
end
