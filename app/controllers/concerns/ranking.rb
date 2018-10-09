module Ranking
  extend ActiveSupport::Concern
  included do
    def get_ranking_items
      # 規定日数以上閲覧されていないものと閲覧数が０のものは足切りする
      @items = Item.where("(checked_items_count > ?) and (created_at > ?)", 0, 7.days.ago)

      a = 0.1 # 閲覧数の重み付け...0.1pt
      b = 2 # お気に入り登録数の重み付け...2pt
      c = 3 # カートに入れられている数の重み付け...3pt
      d = 4 # 注文数の重み付け...4pt
      @rankings = {}
      @items.each do |item|
        # 各アイテムのscoreを計算しhashに格納する
        time_conf = (Time.current.day - item.created_at.day) / 10
        score = (a * item.checked_items_count + b * item.favorite_items_count + c * item.shoppings_count + d * item.ordered_items_count) - time_conf
        @rankings.store(item, score)
      end
      # hashを降順にソートし配列として取得する
      return @rankings.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }

    end
  end
end
