class ScrapingAllItem
  GET_ITEM_NUM = 5 #各ショップページから取得するアイテム数

  def search_item_links(url)
    agent = Mechanize.new
    page = agent.get(url)
    # shopロゴの取得
    if page.search("#shopMainVisual img")[0]
      logo_url = page.search("#shopMainVisual img")[0].get_attribute("src")
      shop_name = page.search("#breadCrumb a")[1].inner_text
      shop = Shop.where(name: shop_name).first_or_initialize
      shop.url = "http:" + logo_url
      shop.gender = 0
      shop.save
    end

    elements = page.search(".thumb a")
    item_numbers = []
    item_links = []
    count = 0
    elements.each do |ele|
      link = "http://zozo.jp" + ele.get_attribute("href")
      item_num = link.match(/\d+/)
      if link.match(/shop/) && link.length < 100
        if item_numbers.include?(item_num[0]) == false && count < GET_ITEM_NUM
          item_numbers << item_num[0]
          item_links << link
          count += 1
          puts link
        end
      end
    end
    return item_links
  end

  def register_all_items
    agent = Mechanize.new
    page = agent.get("http://zozo.jp")
    elements = page.search(".rankingList a")
    shop_links = []
    shop_names = []
    # トップページのランキングからショップ詳細ページへのURLを取得する
    elements.each do |ele|
      link = "http://zozo.jp" + ele.get_attribute("href")
      shop_name = link.split("/")
      if shop_names.include?(shop_name[-1]) == false
        shop_names << shop_name[-1]
        shop_links << link
      end
    end
    # ショップ詳細ページからアイテム詳細ページへのURLを取得する
    item_links = []
    shop_links.each do |link|
      item_links << search_item_links(link)
    end
    item_links.each do |links|
      links.each do |link|
        i = ScrapingItem.new
        i.register_database(link)
      end
    end
  end
end
