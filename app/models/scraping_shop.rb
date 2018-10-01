class ScrapingShop
  def get_shops(page)
    elements = page.search(".name" )
    shops = []
    elements.each do |ele|
      shops << ele.inner_text
    end
    return shops
  end

  def create_record(shops, gender_num)
    shops.each do |name|
      if shop = Shop.find_by(name: name)
        new_shop = shop
        new_shop.gender = 4
      else
        new_shop = Shop.new
        new_shop.gender = gender_num
      end
      new_shop.name = name
      new_shop.save
    end
  end

  def register_database
    agent = Mechanize.new

    # ショップ情報の取得
    page = agent.get("http://zozo.jp/men-shop/")
    mens_shops = get_shops(page)
    page = agent.get("http://zozo.jp/women-shop/")
    womens_shops = get_shops(page)
    page = agent.get("http://zozo.jp/kids-shop/")
    kids_shops = get_shops(page)

    # メンズショップの登録
    create_record(mens_shops, 1)
    # レディースショップの取得
    create_record(womens_shops, 2)
    # キッズショップの取得
    create_record(kids_shops, 3)
  end
end
