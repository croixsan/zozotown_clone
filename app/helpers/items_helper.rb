module ItemsHelper
  def favorite_item?(item_num_id)
    current_user.favorite_items.find_by(item_num_id: item_num_id)
  end
end
