class CartsController < ApplicationController
  include Checked
  include SavedCart

  def index
    @cart = current_user.cart
    @items = @cart.items
    # カートに含まれる同じアイテムをアイテム番号毎にグループ化
    @item_nums = @cart.item_nums.group(:number)
    @count = @item_nums.count
    # カート内の合計金額を算出
    @total_price = get_total_price(@items)
    @cart.update(total_price: @total_price)
    # チェックしたアイテム
    @checked_items = get_checked_items

    # 「以前カートに入れたアイテム」機能
    @past_item_nums = get_past_item_nums
  end

  def create
    Shopping.create(cart_params)

    # 「以前カートに入れたアイテム」機能
    current_user.past_carts.where(item_num_id: params[:item_num_id]).first_or_create.update(updated_at: Time.current)
    
    redirect_to controller: 'carts', action: 'index'
  end

  def destroy
    if params[:id]
      shoppings = Shopping.where(item_id: params[:id])
      shoppings.destroy_all
    elsif params[:item_id]
      shopping = Shopping.find_by(item_id: params[:item_id])
      shopping.destroy
    end
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

  def get_total_price(items)
    total_price = 0
    items.each do |item|
      total_price += item.price
    end
    return total_price
  end
end
