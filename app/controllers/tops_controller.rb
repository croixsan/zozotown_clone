class TopsController < ApplicationController
  def index
    @zozo_brand = Brand.find_by(name: "ZOZO")
    @zozo_items = @zozo_brand.items.limit(3).includes(:images)
    @coupon = Coupon.find_by(price: 5000)
    @coupon_items = @coupon.items.limit(7).includes(:images)
    @rank_items = Item.order("created_at DESC").limit(7).includes(:images)
    @checked_items = Item.order("created_at DESC").limit(15).includes(:images)
    @top_categories = TopCategory.all
    @brands = Brand.order("created_at DESC").limit(10)
  end

  def men
  end

  def women
  end

  def kid
  end
end
