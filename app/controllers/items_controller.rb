class ItemsController < ApplicationController
  def index
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
  end
end
