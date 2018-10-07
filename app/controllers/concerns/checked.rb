module Checked
  extend ActiveSupport::Concern
  included do
    def get_checked_items
      # 以前閲覧したアイテムを取得する
      checked_items = current_user.checked_items.order("created_at DESC").map do |checked_item|
         Item.includes(:images).find_by(id: checked_item.item_id)
      end
      return checked_items
    end
  end
end
