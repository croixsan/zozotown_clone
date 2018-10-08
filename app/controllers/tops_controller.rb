class TopsController < ApplicationController
<<<<<<< HEAD
=======
  include Checked

>>>>>>> master
  def index
    @zozo_brand = Brand.find_by(name: "ZOZO")
    @zozo_items = @zozo_brand.items.limit(3).includes(:images)
    # @coupon = Coupon.find_by(price: 5000)
    @coupon_items = Item.order("created_at DESC").limit(7)
    @rank_items = Item.order("created_at DESC").limit(7).includes(:images)
<<<<<<< HEAD
    @checked_items = Item.order("created_at DESC").limit(15).includes(:images)
    @top_categories = TopCategory.all
    @brands = Brand.order("items_count DESC").limit(10)
    @shops = Shop.order("items_count DESC").limit(10)
=======

    @top_categories = TopCategory.all
    @brands = Brand.order("items_count DESC").limit(10)
    @shops = Shop.order("items_count DESC").limit(10)

    # チェックしたアイテム
    @checked_items = get_checked_items
>>>>>>> master
  end

  def men
  end

  def women
  end

  def kid
  end
end
