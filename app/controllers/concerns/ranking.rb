module Ranking
  extend ActiveSupport::Concern
  included do
    def get_ranking_items
      # 規定日数以上閲覧されていないものと閲覧数が０のものは足切りする
      @items = Item.where("(checked_items_count > ?) and (created_at > ?)", 0, 7.days.ago)

      # 閲覧数の重み付け...0.1pt
      # お気に入り登録数の重み付け...2pt
      # カートに入れられている数の重み付け...3pt
      # 注文数の重み付け...4pt
      conf = {
        checked_item: 0.1,
        favorite_item: 2,
        shopping_item: 3,
        order_item: 4
      }
      @rankings = {}
      @items.each do |item|
        # 各アイテムのscoreを計算しhashに格納する
        time_conf = (Time.current.day - item.created_at.day) / 10
        score = (conf[:checked_item] * item.checked_items_count + conf[:favorite_item] * item.favorite_items_count + conf[:shopping_item] * item.shoppings_count + conf[:order_item] * item.ordered_items_count) - time_conf
        @rankings.store(item, score)
      end
      # hashを降順にソートし配列として取得する
      return @rankings.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }

    end
  end
end
