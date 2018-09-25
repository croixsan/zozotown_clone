class TestsController < ApplicationController
  def index
    @tops = ["Tシャツ/カットソー", "シャツ/ブラウス", "ポロシャツ", "ニット/セーター", "ベスト", "パーカー", "スウェット", "カーディガン", "アンサンブル", "ジャージ", "タンクトップ", "キャミソール", "チューブトップ", "その他トップス"]
  end
end
