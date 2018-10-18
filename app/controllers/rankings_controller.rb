class RankingsController < ApplicationController
  include Ranking
  include SetCoupon
  before_action :set_coupon

  def index
    @rankings = get_ranking_items.slice(0, 100)
  end
end
