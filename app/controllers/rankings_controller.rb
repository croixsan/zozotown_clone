class RankingsController < ApplicationController
  include Ranking
  include SetCoupon
  include SetCart
  before_action :set_coupon, :set_cart

  def index
    @rankings = get_ranking_items.slice(0, 100)
  end
end
