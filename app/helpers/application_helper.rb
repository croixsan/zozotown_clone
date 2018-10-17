module ApplicationHelper
  # pathの先頭にmens, ladies, kidsの文字列を与える
  def get_mens_path
    url = request.path_info
    if url.include?("mens")
      return url
    elsif url.include?("ladies")
      return url.sub("ladies", "mens")
    elsif url.include?("kids")
      return url.sub("kids", "mens")
    else
      return "/mens" + url
    end
  end

  def get_ladies_path
    url = request.path_info
    if url.include?("mens")
      return url.sub("mens", "ladies")
    elsif url.include?("ladies")
      return url
    elsif url.include?("kids")
      return url.sub("kids", "ladies")
    else
      return "/ladies" + url
    end
  end

  def get_kids_path
    url = request.path_info
    if url.include?("mens")
      return url.sub("mens", "kids")
    elsif url.include?("ladies")
      return url.sub("ladies", "kids")
    elsif url.include?("kids")
      return url
    else
      return "/kids" + url
    end
  end

  def get_next_path
    case controller.controller_name
    when "brands"
      return brands_path
    when "shops"
      return shops_path
    when "top_categories"
      return top_categories_path
    end
  end

end
