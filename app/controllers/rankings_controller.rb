class RankingsController < ApplicationController
  include Ranking
  def index
    @rankings = get_ranking_items.slice(0, 100)
  end
end
