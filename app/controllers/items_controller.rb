class ItemsController < ApplicationController
  def index
  end

  def show
    @cart = current_user.cart
    @item = Item.find(params[:id])
    @images = Image.find(params[:id])
  end
end
