class TopsController < ApplicationController
  include Checked
  include Ranking
  def index
    @zozo_brand = Brand.find_by(name: "ZOZO")
    @zozo_items = @zozo_brand.items.limit(3).includes(:images)
    # @coupon = Coupon.find_by(price: 5000)
    @coupon_items = Item.order("created_at DESC").limit(7)
    @top_categories = TopCategory.all
    @brands = Brand.order("items_count DESC").limit(10)
    @shops = Shop.order("items_count DESC").limit(10)
    # チェックしたアイテム
    @checked_items = get_checked_items
    # チェックしたショップ
    @checked_shops = get_checked_shops

    @rankings = get_ranking_items.slice(0, 23)

  end

  def men
  end

  def women
  end

  def kid
  end
end
