class FavoritesController < ApplicationController
  before_action :set_render_parameter, only: [:create, :destroy]

  def index
    @favorite_items = current_user.favorite_items
  end

  def create
    current_user.favorite_items.create(item_num_id: params[:item_num_id])
  end

  def destroy
    favorite_items = current_user.favorite_items
    favorite_items.find_by(item_num_id: params[:item_num_id]).destroy()
  end

  private
  def set_render_parameter
    # 部分テンプレートのrenderパラメーターを設定
    @item = Item.find(params[:item_id])
    @shop = @item.shop
    @item_num_id = params[:item_num_id]
  end
end
