class ScrapingBrand
  def get_brands(page)
    elements = page.search(".name" )
    brands = []
    elements.each do |ele|
      brands << ele.inner_text
    end
    return brands
  end

  def create_record(brands, gender_num)
    brands.each do |name|
      if brand = Brand.find_by(name: name)
        new_brand = brand
        new_brand.gender = 4
      else
        new_brand = Brand.new
        new_brand.gender = gender_num
      end
      new_brand.name = name
      new_brand.save
    end
  end

  def register_database
    agent = Mechanize.new

    # ショップ情報の取得
    page = agent.get("http://zozo.jp/men-brand/")
    mens_brands = get_brands(page)
    page = agent.get("http://zozo.jp/women-brand/")
    womens_brands = get_brands(page)
    page = agent.get("http://zozo.jp/kids-brand/")
    kids_brands = get_brands(page)

    # メンズショップの登録
    create_record(mens_brands, 1)
    # レディースショップの取得
    create_record(womens_brands, 2)
    # キッズショップの取得
    create_record(kids_brands, 3)
  end
end
