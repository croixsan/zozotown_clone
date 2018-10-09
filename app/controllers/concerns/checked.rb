module Checked
  extend ActiveSupport::Concern
  included do
    def get_checked_items
      # 以前閲覧したアイテムを取得する
      checked_items = current_user.checked_items.order("updated_at DESC").map do |checked_item|
        Item.includes(:images).find_by(id: checked_item.item_id)
      end
      return checked_items
    end

    def get_checked_shops
      # 以前閲覧したショップを取得する
      checked_shops = current_user.checked_shops.order("updated_at DESC").map do |checked_shop|
        Shop.find_by(id: checked_shop.shop_id)
      end
      return checked_shops
    end
  end
end
