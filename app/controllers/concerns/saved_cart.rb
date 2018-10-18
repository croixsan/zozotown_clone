module SavedCart
  extend ActiveSupport::Concern
  included do
    def get_past_item_nums
      # 以前カートに入れたアイテムを取得する
      past_all_item_nums = current_user.past_carts.order("updated_at DESC").limit(5).map do |past_cart|
        past_cart.item_num
      end
      set1 = Set.new(@item_nums) # 現在カートに入っているアイテム
      set2 = Set.new(past_all_item_nums) # 過去にカートに入れた全てのアイテム
      return set2 - set1
    end
  end
end
