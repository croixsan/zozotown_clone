class RankingsController < ApplicationController
  include Ranking
  def index
    @rankings = get_ranking_items
  end
end
