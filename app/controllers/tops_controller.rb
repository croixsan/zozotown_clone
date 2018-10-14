class TopsController < ApplicationController
  include Checked
  include Ranking
  include Search

  def index
    items = Item.all
    url = request.path_info
    @items = search_items_by_gender(url, items)

    @newest_items = @items.order("created_at DESC").includes(:images).limit(9)
    @coupon_items = @items.order("created_at DESC").includes(:images).limit(9)
    @top_categories = TopCategory.all.includes(:sub_categories)
    @brands = Brand.order("items_count DESC").includes(:items).limit(10)
    @shops = Shop.order("items_count DESC").includes(:items).limit(10)

    if user_signed_in?
      # チェックしたアイテム
      @checked_items = get_checked_items.slice(0, 18)
      # チェックしたショップ
      @checked_shops = get_checked_shops.slice(0, 8)
    end

    @rankings = get_ranking_items.slice(0, 9)

  end

  def men
  end

  def women
  end

  def kid
  end
end
