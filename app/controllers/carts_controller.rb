class CartsController < ApplicationController

  def index
    @cart = Cart.find_by(user_id: 1)
    @items = @cart.items
  end

  def create
    Shopping.create(item_id: cart_params[:item_id], cart_id: cart_params[:cart_id])
    redirect_to :controller => 'carts', :action => 'index'
  end

  private
  def cart_params
    params.permit(:item_id, :cart_id)
  end

  def register
    current_user.build_cart
    redirect_to :root
  end
end
