class BrandsController < ApplicationController
  def index
    @brands = []
    # アルファベットで始まるショップの検索
    ("A".."Z").each_with_index do |initial, i|
      @brands << Brand.where("name LIKE(?)", "#{initial}%").includes(:items)
    end
  end
end
