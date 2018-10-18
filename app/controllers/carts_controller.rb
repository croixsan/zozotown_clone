class CartsController < ApplicationController
  include Checked
  include SavedCart
  include SetCart
  include SetCoupon
  before_action :set_coupon
  before_action :set_cart, except: :register
  before_action :authenticate_user!

  def index
    @cart = current_user.cart
    @items = @cart.items
    # カートに含まれる同じアイテムをアイテム番号毎にグループ化
    @item_nums = @cart.item_nums.group(:number)
    @count = @item_nums.count
    # カート内の合計金額を算出
    @total_price = get_total_price(@item_nums)
    @cart.update(total_price: @total_price)
    # チェックしたアイテム
    @checked_items = get_checked_items.slice(0, 8)

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
    if params[:delete] == "delete_all"
      current_user.cart.shoppings.where(item_num_id: params[:item_num_id].to_i).destroy_all
    else
      current_user.cart.shoppings.find_by(item_num_id: params[:item_num_id].to_i).destroy
    end
    redirect_to :controller => 'carts', :action => 'index'
  end

  def register
    Cart.create(user_id: current_user.id, total_price: 0)
    current_user.update(point: 0)
    redirect_to users_path(id: current_user.id), notice: "ユーザー登録をしました。\n基本情報の登録をお願いします。"
  end

  private
  def cart_params
    params.permit(:item_id, :item_num_id).merge(cart_id: current_user.cart.id)
  end

  def get_total_price(item_nums)
    total_price = 0
    item_nums.each do |item_num|
      if item_num.stock.stock > 0
        total_price += item_num.item.price
      end
    end
    return total_price
  end
end
