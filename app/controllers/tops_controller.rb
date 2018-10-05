class TopsController < ApplicationController
  def index
    @zozo_brand = Brand.find_by(name: "ZOZO")
    @zozo_items = @zozo_brand.items.limit(3)
    @coupon = Coupon.find_by(price: 5000)
    @coupon_items = @coupon.items.limit(7)
    @rank_items = Item.order("created_at DESC").limit(7)
    @checked_items = Item.order("created_at DESC").limit(15)
    @top_categories = TopCategory.all
    @brands = Brand.order("created_at DESC").limit(10)

    @shop_images = ["https://img4.zozo.jp/common/shop/shop_1982.jpg", "https://img4.zozo.jp/common/shop/shop_752.jpg", "https://img4.zozo.jp/common/shop/shop_361.jpg", "https://img4.zozo.jp/common/shop/shop_273.jpg", "https://img4.zozo.jp/common/shop/shop_1320.jpg",
    "https://img4.zozo.jp/common/shop/shop_100.jpg", "https://img4.zozo.jp/common/shop/shop_1889.jpg", "https://img4.zozo.jp/common/shop/shop_71.jpg", "https://img4.zozo.jp/common/shop/shop_197.jpg", "https://img4.zozo.jp/common/shop/shop_1144.jpg", "https://img4.zozo.jp/common/shop/shop_72.jpg"]

  end

  def men
  end

  def women
  end

  def kid
  end
end
