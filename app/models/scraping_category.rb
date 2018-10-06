class ScrapingCategory
  def get_top_category(page, search_word)
    categories = []
    elements = page.search(search_word)
    elements.each do |ele|
      categories << ele.inner_text
    end
    return categories
  end

  def get_category_images()
    agent = Mechanize.new
    page = agent.get("http://zozo.jp/category/")
    img_elements = page.search(".thumbList img")
    images = []
    img_elements.each do |ele|
      images << ele.get_attribute("src")
    end
    return images
  end

  def get_category_names()
    agent = Mechanize.new
    page = agent.get("http://zozo.jp/category/")
    name_elements = page.search(".thumbList p")
    names = []
    name_elements.each do |ele|
      names << ele.inner_text
    end
    return names
  end

  def register_database
    agent = Mechanize.new
    page = agent.get("http://zozo.jp/category/")
    keyword = "#anchorLists a"
    top_category = get_top_category(page, keyword)

    tops =['Tシャツ/カットソー', 'シャツ/ブラウス', 'ポロシャツ', 'ニット/セーター', 'ベスト', 'パーカー', 'スウェット', 'カーディガン', 'アンサンブル', 'ジャージ', 'タンクトップ', 'キャミソール', 'チューブトップ', 'その他トップス']
    jacket_outerwear = ['テーラードジャケット', 'ノーカラージャケット', 'デニムジャケット', 'ライダースジャケット', 'ブルゾン', 'カバーオール', 'ミリタリージャケット', 'MA-1', 'ダウンベスト', 'ダウンジャケット/コート', 'ダッフルコート', 'モッズコート', 'ピーコート', 'ステンカラーコート', 'トレンチコート', 'チェスターコート', 'ムートンコート', 'ナイロンジャケット', 'マウンテンパーカー', 'スタジャン', 'ポンチョ', 'その他アウター']
    pants = ['デニムパンツ', 'カーゴパンツ', 'チノパンツ', 'スラックス', 'パンツ']
    allinone_salopette = ['サロペット/オーバーオール', 'つなぎ/オールインワン']
    skirt = ['スカート', 'デニムスカート']
    onepiece = ['ワンピース', 'シャツワンピース', 'ジャンパースカート', 'チュニック', 'ドレス']
    suit = ['スーツジャケット', 'スーツベスト', 'スーツパンツ', 'スーツスカート', 'セットアップ', 'ネクタイ', '蝶ネクタイ', 'ネクタイピン', 'カフリンクス']
    bag = ['ショルダーバッグ', 'トートバッグ', 'バックパック/リュック', 'ボストンバッグ', 'ボディバッグ/ウエストポーチ', 'ハンドバッグ', 'クラッチバッグ', 'メッセンジャーバッグ', 'ビジネスバッグ', 'スーツケース/キャリーバッグ', 'ドラムバッグ', 'エコバッグ/サブバッグ', 'かごバッグ']
    shoes = ['スニーカー', 'スリッポン', 'サンダル', 'パンプス', 'ブーツ', 'ブーティ', 'ドレスシューズ', 'バレエシューズ', 'ローファー', 'モカシン/デッキシューズ', 'レインシューズ', 'ビーチサンダル', 'その他シューズ', 'シューケア/シューズ小物']
    fashion_accessories = ['ストール/スヌード', 'マフラー/ショール', 'ベルト', 'サスペンダー', 'サングラス', 'メガネ', '手袋', 'ネックウォーマー', 'イヤーマフ', '長傘', '折りたたみ傘', 'レインコート/ポンチョ']
    wallet_accessory = ['財布', 'コインケース/札入れ', '名刺入れ', 'ポーチ', '手鏡/コンパクト', 'ハンカチ/ハンドタオル', 'バンダナ/スカーフ', 'キーホルダー', 'キーケース/キーアクセサリー', 'ウォレットチェーン', 'パスケース', 'カードケース', 'パスポートケース', '扇子/うちわ', 'その他小物']
    wrist_watch= ['腕時計', '置時計', '掛け時計']
    hair_accessory = ['ヘアゴム', 'ヘアバンド', 'カチューシャ', 'バレッタ/ヘアクリップ', 'ヘアピン', 'シュシュ', 'その他ヘアアクセサリー', 'ウィッグ']
    accessory = ['ネックレス', 'リング', 'ピアス（両耳用）', 'ピアス（片耳用）', 'イヤリング（両耳用）', 'イヤリング（片耳用）', 'ブレスレット', 'バングル/リストバンド', 'アンクレット', 'チョーカー', 'ブローチ/コサージュ', 'チャーム']
    underwear = ['ブラ', 'ショーツ', 'ブラ&ショーツ', 'トランクス', 'ボクサーパンツ','ルームウェア/パジャマ', 'その他アンダーウェア/インナー']
    leg_wear = ['ソックス/靴下', 'タイツ/ストッキング', 'レギンス/スパッツ', 'レッグウォーマー']
    hat = ['キャップ', 'ハット', 'ニットキャップ/ビーニー', 'ハンチング/ベレー帽', 'キャスケット', 'サンバイザー']
    interior = ['クッション/クッションカバー', 'ルームシューズ/スリッパ', 'フェイスタオル', 'バスタオル', 'キャンドル', 'お香/ルームフレグランス', 'インテリアアクセサリー', 'フォトフレーム', 'フラワーベース', 'ベッドリネン', 'ラグ/マット', 'ブランケット', '収納グッズ', 'ダストボックス', '照明', '家具', '生活家電/PCグッズ', 'オーディオ家電', 'ミラー', 'バス/トイレグッズ', 'ランドリーグッズ']
    tableware_kitchenware = ['食器', 'グラス/マグカップ/タンブラー', 'カトラリー', 'キッチンツール', 'エプロン', 'キッチン家電']
    zakka_hobby_sports = ['ペン類', '手帳/メモ帳', 'ステッカー/テープ', 'ステーショナリー', 'モバイルケース/カバー', 'モバイルアクセサリー', 'おもちゃ', 'フィギュア', 'バッジ', 'アッシュトレイ/ライター', 'ポスター/アート', 'スポーツグッズ', 'ゴルフグッズ', 'カメラ/カメラグッズ', 'ペットグッズ', 'トラベルグッズ', 'コスチューム/パーティーグッズ', 'その他雑貨']
    cosmetics_perfume = ['香水', 'スキンケア', 'メイクアップ', 'コンタクトレンズ', 'ボディケア', 'ネイル/ハンドケア', 'リップケア', 'ヘアケア', '美容器具', '石鹸/ボディソープ', '入浴剤', 'オーラルケア/歯磨きグッズ', 'メイク雑貨', 'ギフトセット', 'その他コスメ']
    music_books = ['CD', 'DVD', 'レコード', '本', '雑誌']
    swimwear_kimono_yukata = ['水着', 'ラッシュガード', 'スイムグッズ', '着物/浴衣', '和装小物']
    maternity_baby = ['マタニティベビー', 'マタニティウェア', 'マタニティグッズ', '母子手帳ケース', 'マザーバッグ/収納ポーチ', 'スタイ/よだれかけ', 'ロンパース', '肌着', 'おくるみ', 'ベビー用品', 'お食事グッズ', 'ベビーカー用品', 'ベビーシューズ', 'ベビーギフト']
    others = ['福袋/福箱', 'ラッピングキット', '採寸ボディースーツ']

    top_category_lists = [tops, jacket_outerwear, pants, allinone_salopette, skirt, onepiece, suit, bag, shoes, fashion_accessories, wallet_accessory, wrist_watch, hair_accessory, accessory, underwear, leg_wear, hat, interior, tableware_kitchenware, zakka_hobby_sports, cosmetics_perfume, music_books, swimwear_kimono_yukata, maternity_baby, others]

    top_category.each do |t_name|
      new_top_category = TopCategory.where(name: t_name).first_or_initialize
      new_top_category.name = t_name
      new_top_category.save
    end

    sub_category_images = get_category_images
    sub_category_names = get_category_names

    k = 0
    top_category_lists.each_with_index do |list, i|
      list.each do |s_name|
        item = top_category[i]
        t = TopCategory.find_by(name: item)
        sub_category = SubCategory.where(name: s_name).first_or_initialize
        sub_category.name = s_name
        sub_category.image = get_category_images[k]
        sub_category.top_category_id = t.id
        sub_category.save
        k += 1
      end
    end
  end
end
