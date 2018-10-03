class ItemsController < ApplicationController
  def index
  end

  def show
    @cart = Cart.find_by(user_id: 1)
    #1はcurrent_user.idにする
    @items = Item.find(params[:id])
    @images = Image.find(params[:id])
  end
end
