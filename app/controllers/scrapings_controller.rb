class ScrapingsController < ApplicationController
  def index
    item = ScrapingAllItem.new
    item.register_all_items
    redirect_to root_path
  end

  def payment
    # paymentを登録
    payment = Payment.where(method: "ツケ払い").first_or_create(method: "ツケ払い", price: 324, point_rate: 0.1)
    payment = Payment.where(method: "代金引換").first_or_create(method: "代金引換", price: 0, point_rate: 0.1)
    payment = Payment.where(method: "クレジットカード").first_or_create(method: "クレジットカード", price: 0, point_rate: 0.1)
    redirect_to root_path
  end

  def delivery
    # deliveryを登録
    delivery = Delivery.where(kind: "指定なし").first_or_create(kind: "指定なし", price: 200)
    delivery = Delivery.where(kind: "日時指定").first_or_create(kind: "日時指定", price: 200)
    delivery = Delivery.where(kind: "即日配送").first_or_create(kind: "日時指定", price: 550)
    redirect_to root_path
  end

  def shop
    #ショップをデータベースに登録
    s = ScrapingShop.new
    s.register_database
  end

  def brand
    #ブランドをデータベースに登録
    b = ScrapingBrand.new
    b.register_database
  end

  def category
    # カテゴリーをデータベースに登録
    t = ScrapingCategory.new
    t.register_database
  end
end
