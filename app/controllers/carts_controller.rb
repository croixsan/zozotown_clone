class CartsController < ApplicationController
  def index

    @tops = ["Tシャツ/カットソー", "シャツ/ブラウス", "ポロシャツ", "ニット/セーター", "ベスト", "パーカー", "スウェット", "カーディガン", "アンサンブル", "ジャージ", "タンクトップ", "キャミソール", "チューブトップ", "その他トップス"]
    @jackets = ["テーラードジャケット", "ノーカラージャケット", "デニムジャケット", "ライダースジャケット", "ブルゾン", "カバーオール", "ミリタリージャケット", "MA-1", "ダウンベスト", "ダウンジャケット/コート", "ダッフルコート","モッズコート", "ピーコート", "ステンカラーコート", "トレンチコート", "チェスターコート", "ムートンコート", "ナイロンジャケット", "マウンテンパーカー", "スタジャン", "ポンチョ", "その他アウター"]
    @bag = ['ショルダーバッグ', 'トートバッグ', 'バックパック/リュック', 'ボストンバッグ', 'ボディバッグ/ウエストポーチ', 'ハンドバッグ', 'クラッチバッグ', 'メッセンジャーバッグ', 'ビジネスバッグ', 'スーツケース/キャリーバッグ', 'ドラムバッグ', 'エコバッグ/サブバッグ', 'かごバッグ']
    @shoes = ['スニーカー', 'スリッポン', 'サンダル', 'パンプス', 'ブーツ', 'ブーティ', 'ドレスシューズ', 'バレエシューズ', 'ローファー', 'モカシン/デッキシューズ', 'レインシューズ', 'ビーチサンダル', 'その他シューズ', 'シューケア/シューズ小物']
    @pants = ['デニムパンツ', 'カーゴパンツ', 'チノパンツ', 'スラックス', 'パンツ']
    @all_in_one = ['サロペット/オーバーオール', 'つなぎ/オールインワン']
    @skirt = [ 'スカート', 'スカート', 'デニムスカート']
    @onepiece = ['ワンピース', 'シャツワンピース', 'ジャンパースカート', 'チュニック', 'ドレス']
    @suits = ['スーツ/ネクタイ', 'スーツジャケット', 'スーツベスト', 'スーツパンツ', 'スーツスカート', 'セットアップ', 'ネクタイ', '蝶ネクタイ', 'ネクタイピン', 'カフリンクス']
    @images = ["https://c.imgz.jp/214/33242214/33242214_385_d_215.jpg", "https://c.imgz.jp/755/21681755/21681755B_8_D_215.jpg", "https://c.imgz.jp/937/35508937/35508937B_2_D_215.jpg", "https://c.imgz.jp/880/34737880/34737880B_10_D_215.jpg", "https://c.imgz.jp/168/7697168/7697168_8_D_215.jpg", "https://c.imgz.jp/343/26557343/26557343_1_D_215.jpg", "https://c.imgz.jp/201/33418201/33418201B_18_D_215.jpg", "https://c.imgz.jp/078/34090078/34090078_166_d_215.jpg","https://c.imgz.jp/684/32995684/32995684_15_D_215.jpg", "https://c.imgz.jp/852/32621852/32621852_18_d_215.jpg", "https://c.imgz.jp/938/27651938/27651938B_8_D_215.jpg","https://c.imgz.jp/342/35777342/35777342B_16_D_215.jpg","https://c.imgz.jp/546/35711546/35711546B_20_d_215.jpg", "https://c.imgz.jp/478/35198478/35198478B_171_D_215.jpg", "https://c.imgz.jp/902/34913902/34913902B_18_D_215.jpg", "https://c.imgz.jp/903/34913903/34913903B_2_D_215.jpg", "https://c.imgz.jp/578/27751578/27751578B_1_D_215.jpg", "https://c.imgz.jp/908/29232908/29232908B_32_D_215.jpg", "https://c.imgz.jp/878/24319878/24319878B_8_D_215.jpg", "https://c.imgz.jp/397/25730397/25730397B_8_D_215.jpg","https://c.imgz.jp/390/33003390/33003390B_14_D_215.jpg", "https://c.imgz.jp/370/35502370/35502370B_17_d_125.jpg"
    ]

    @shop_images = ["https://img4.zozo.jp/common/shop/shop_1982.jpg", "https://img4.zozo.jp/common/shop/shop_752.jpg", "https://img4.zozo.jp/common/shop/shop_361.jpg", "https://img4.zozo.jp/common/shop/shop_273.jpg", "https://img4.zozo.jp/common/shop/shop_1320.jpg",
    "https://img4.zozo.jp/common/shop/shop_100.jpg", "https://img4.zozo.jp/common/shop/shop_1889.jpg", "https://img4.zozo.jp/common/shop/shop_71.jpg", "https://img4.zozo.jp/common/shop/shop_197.jpg", "https://img4.zozo.jp/common/shop/shop_1144.jpg", "https://img4.zozo.jp/common/shop/shop_72.jpg"]



  end
end