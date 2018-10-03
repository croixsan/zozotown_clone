class ShopsController < ApplicationController
  def index
    @shops = []
    # アルファベットで始まるショップの検索
    ("A".."Z").each do |initial|
      @shops << Shop.where("name LIKE(?)", "#{initial}%").includes(:items)
    end
  end

  def show
  end
end
