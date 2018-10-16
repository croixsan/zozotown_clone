class ItemsController < ApplicationController
  include Search
  def index
    now = Time.current
    @items = Item.where("created_at > ?", now - 7.days).order("created_at DESC").includes([:images, :shop, :brand])
    # itemの絞り込み
    url = request.path_info
    @items = search_items_by_gender(url, @items)
    @top_categories = TopCategory.all.includes(:sub_categories)
  end

  def show
    if user_signed_in?
      @cart = current_user.cart
    end
    @item = Item.find(params[:id])
    @shop = @item.shop
    @images = @item.images
    @related_items = Item.where(shop_id: @item.shop.id)
    @color_count = @item.images.group(:color).length - 1 # -1: nilを除外
    @stock_count = @item.stocks.length

    if user_signed_in?
      # 「チェックしたアイテム」機能
      current_user.checked_items.where(item_id: @item.id).first_or_create.update(updated_at: Time.current)
    end

    # クーポン機能
    @coupon = Coupon.first
    if Coupon.exists?
      @coupon = Coupon.first
      @coupon_shops = Coupon.all.includes(:shop).map{|coupon| coupon.shop}
      @items = @coupon_shops.map{|shop| shop.items}
      @items = @items.flatten
    end
  end
end
