class CartsController < ApplicationController

  def index
    @cart = current_user.cart
    @items = @cart.items
    # カートに含まれる同じアイテムを
    @item_nums = @cart.item_nums.group(:number)
    @count = @item_nums.count
    # @shoppings = Shopping.group(:item_id).count
  end

  def create
    Shopping.create(cart_params)
    redirect_to controller: 'carts', action: 'index'
  end

  def destroy
    shopping = Shopping.where(item_id: params[:id])
    shopping.destroy_all
    redirect_to :controller => 'carts', :action => 'index'
  end

  def register
    Cart.create(user_id: current_user.id, total_price: 0)
    redirect_to :root
  end

  private
  def cart_params
    params.permit(:item_id, :cart_id, :item_num_id)
  end


end
