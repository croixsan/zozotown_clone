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
    # 既にアイテムを閲覧していれば既存のレコードを削除
    checked_item.destroy if checked_item
    current_user.checked_items.create(item_id: @item.id)

    # チェックしたアイテムが規定数を超えた場合、古いレコードを削除
    if current_user.checked_items.length > 20
      checked_items.first.destroy
    end

  end
end
