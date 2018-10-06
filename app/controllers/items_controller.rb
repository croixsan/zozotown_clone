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
    checked_items = current_user.checked_items
    # 同じアイテムを過去に閲覧していなければレコード作成
    if checked_items.find_by(item_id: @item.id) == nil
      checked_items.create(item_id: @item.id)
    end
    if checked_items.length > 20
      checked_items.first.destroy
    end

  end
end
