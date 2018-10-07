class ItemsController < ApplicationController
  def index
  end

  def show
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @images = @item.images
    @related_items = Item.where(shop_id: @item.shop.id)
    @color_count = @item.images.group(:color).length - 1 # -1: nilを除外
    @stock_count = @item.stocks.length

    # 「チェックしたアイテム」機能
    current_user.checked_items.where(item_id: @item.id).first_or_create.update(updated_at: Time.now)
  end
end
