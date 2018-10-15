module Search
  extend ActiveSupport::Concern
  included do
    def search_items_by_gender(url, items)
      if url.include?("mens")
        return items.where("(gender = ?) OR (gender = ?)", 1, 4)
      elsif url.include?("ladies")
        return items.where("(gender = ?) OR (gender = ?)", 2, 4)
      elsif url.include?("kids")
        return items.where("(gender = ?) OR (gender = ?)", 3, 4)
      else
        return items
      end
    end

    def search_items_by_brand(url, items)
      if url.include?("brands")
        items = items.where(brand_id: params[:brand_id])
      end
      return items
    end

    def search_items_by_shop(url, items)
      if url.include?("shops")
        items = items.where(shop_id: params[:shop_id])
      end
      return items
    end
  end
end
