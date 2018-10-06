class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys =[[:gender], [:post_num], [:address], [:phone_num], [:name], [:birth_year], [:birth_month], [:birth_day]]
    keys.each do |key|
      devise_parameter_sanitizer.permit(:sign_up, keys: key)
    end
  end

  def search_items_by_gender(url, items)
    if url.include?("mens")
      return @items.where("(gender = ?) OR (gender = ?)", 1, 4)
    elsif url.include?("ladies")
      return @items.where("(gender = ?) OR (gender = ?)", 2, 4)
    elsif url.include?("kids")
      return @items.where("(gender = ?) OR (gender = ?)", 3, 4)
    else
      return @items
    end
  end

  def search_items_by_brand(url, items)
    if url.include?("brands")
      @items = @items.where(brand_id: params[:brand_id])
    end
    return @items
  end

  def search_items_by_shop(url, items)
    if url.include?("shops")
      @items = @items.where(shop_id: params[:shop_id])
    end
    return @items
  end

  # 以前チェックしたアイテムを取得する
  def get_checked_items
    checked_items = current_user.checked_items.order("created_at DESC").map do |checked_item|
       Item.includes(:images).find_by(id: checked_item.item_id)
    end
    return checked_items
  end
end
