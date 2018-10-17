class ShopsController < ApplicationController
  include Search
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

    if user_signed_in?
      # チェックしたショップ機能
      current_user.checked_shops.where(shop_id: @shop.id).first_or_create.update(updated_at: Time.current)
    end
  end
end
