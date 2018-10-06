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
    checked_item = current_user.checked_items.find_by(item_id: @item.id)
    if checked_item == nil
      # 同じアイテムを過去に閲覧していなければレコード作成
      current_user.checked_items.create(item_id: @item.id)
    else
      # 閲覧していれば既存のレコードを削除
      checked_item.destroy
      current_user.checked_items.create(item_id: @item.id)
    end

    if current_user.checked_items.length > 20
      checked_items.first.destroy
    end

  end
end
