class ScrapingItem
  def get_brand_name(page)
    brand = ""
    elements = page.search("#nameList li")
    elements.each_with_index do |ele, i|
      if i % 2 != 0
        brand = ele.inner_text.split("：")[1].rstrip
      end
    end
    return brand
  end

  def get_shop_name(page)
    shop = ""
    elements = page.search("#nameList li")
    elements.each_with_index do |ele, i|
      if i % 2 == 0
        shop = ele.inner_text.split("：")[1].rstrip
      end
    end
    return shop
  end

  def get_name(page)
    elements = page.search("h1")
    return  elements.inner_text
  end

  def get_description(page)
    elements = page.search(".contbox")
    return elements.inner_text.split("性別")[0].gsub!("	", "").gsub!("\n", "")
  end

  def get_gender(page)
    elements = page.search("dd a")
    word = elements.inner_text.split("登録")[1]
    if word[0] == "メ"
      return 1
    elsif word[0] == "レ"
      return 2
    else word[0] == "キ"
      return 3
    end
  end

  def get_top_category(page)
    elements = page.search(".lineNavi a")
    word = elements[0].inner_text
    return word
  end

  def get_sub_category(page)
    elements = page.search(".lineNavi a")
    word = elements[1].inner_text
    return word
  end

  def get_coupon(page)
    elements = page.search("#useCouponPrice")
    elements.each do |ele|
      if coupon = ele.inner_text.gsub!("\t", "").gsub!("\n", "").match(/\d+,\d+/)
        price_elements = page.search(".couponBannerValueNumber")
        return price_elements.inner_text.gsub("¥", "").gsub(",", "").to_i
      else
        return 0
      end
    end
  end

  def get_image(page)
    images = []
    elements = page.search("#photoThimb img")
    elements.each do |ele|
      images <<  ele.get_attribute("src")
    end
    return images
  end

  def get_price(page)
    elements = page.search(".price")
    if elements.inner_text.match(/\d+,\d+/)
      return elements.inner_text.match(/\d+,\d+/)[0].gsub(",", "").to_i
    else
      return 0
    end
  end

  def get_image(page)
    images = []
    elements = page.search("#photoThimb img")
    elements.each do |ele|
      images << ele.get_attribute("src").gsub("35.jpg", "500.jpg")
    end
    return images
  end


  def get_color(page)
    colors = []
    elements = page.search("#photoThimb p" )
    elements.each do |ele|
      colors << ele.inner_text
    end
    return colors
  end

  def get_size(page)
    sizes = []
    elements = page.search(".stock" )
    elements.each do |ele|
      size = ele.inner_text[0]
      case size
      when "S"
        sizes << 1
      when "M"
        sizes << 2
      when "L"
        sizes << 3
      when "X"
        if ele.inner_text[1] == "L"
          sizes << 4
        else
          sizes << 0
        end
      when "F"
        sizes << 5
      else
        sizes << 6
      end
    end
    return sizes
  end


  def get_stock(page)
    stocks = []
    elements = page.search(".stock" )
    elements.each do |ele|
      word = ele.inner_text[-2]
      if word.match(/\d/)
        stocks << word.to_i
      else
        stocks << 0
      end
    end
    return stocks
  end

  def register_database(url)
    agent = Mechanize.new
    page = agent.get(url)

    brand = get_brand_name(page)          # ブランドの取得
    puts "brand: #{brand}"
    shop = get_shop_name(page)            # ショップの取得
    puts "shop: #{shop}"
    name = get_name(page)                 # 商品名の取得
    puts "name: #{name}"
    description = get_description(page)   # 商品説明の取得
    puts "description: #{description}"
    gender = get_gender(page)             # 性別の取得
    puts "gender: #{gender}"
    top_category = get_top_category(page) # top_categoryの取得
    puts "top_category: #{top_category}"
    sub_category = get_sub_category(page) # sub_categoryの取得
    puts "sub_category: #{sub_category}"
    coupon = get_coupon(page)             # クーポン情報の取得
    puts "coupon: #{coupon}"
    images = get_image(page)              # 画像の取得
    puts "images: #{images}"
    price = get_price(page).to_i          # 価格の取得
    puts "price: #{price}"
    colors = get_color(page)              # 色の取得
    puts "colors: #{colors}"
    sizes = get_size(page)                # サイズの取得
    puts "sizes: #{sizes}"
    stocks = get_stock(page)              # 在庫数の取得
    puts "stocks: #{stocks}"

    item = Item.new
    item = Item.where(name: name).first_or_initialize
    item.name = name
    item.price = price
    item.gender = gender
    item.description = description
    to = TopCategory.find_by(name: top_category)
    su = SubCategory.find_by(name: sub_category)
    co = Coupon.find_by(price: coupon)
    br = Brand.find_by(name: brand)
    sh = Shop.find_by(name: shop)

    if co == nil
      co = Coupon.create(price: coupon)
    end
    if br == nil
      br = Brand.create(name: brand, gender: gender)
    end
    if sh == nil
      sh = Shop.create(name: shop, gender: gender)
    end

    item.top_category_id = to.id
    item.sub_category_id = su.id
    item.brand_id = br.id
    item.shop_id = sh.id
    item.save

    # 画像の登録
    color_index = 0
    images. each do |image|
      im = Image.where(url: image).first_or_initialize
      im.url = image
      im.item_id = item.id
      if color_index < colors.length
        im.color = colors[color_index]
      end
      im.save
      color_index += 1
    end

    # stock, item_numの登録
    num_per_color = stocks.length / colors.length
    new_item = Item.find_by(name: item.name)
    i = 0
    n = 0
    while i < colors.size
      k = 0;
      while k < num_per_color
        # 商品番号の登録
        number = "#{item.id}-#{n+k}"
        item_num = ItemNum.where(number: number).first_or_initialize
        item_num.number = number
        item_num.item_id = new_item.id
        item_num.save
        # 在庫情報の登録
        stock = Stock.where(item_num_id: item_num.id).first_or_initialize
        stock.item_num_id = item_num.id
        stock.item_id = new_item.id
        stock.color = colors[i]
        stock.size = sizes[n+k]
        stock.stock = stocks[n+k]
        puts "item_id: #{stock.item_id}"
        puts "item_num_id: #{stock.item_num_id}"
        puts "color: #{stock.color}"
        puts "size: #{stock.size}"
        puts "stock: #{stock.stock}"


        stock.save
        k += 1
      end
      n += num_per_color
      i += 1
    end
  end
end
