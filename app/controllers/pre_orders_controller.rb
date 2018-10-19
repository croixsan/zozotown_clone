class PreOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :confirm_user_parameter, only: :new
  before_action :confirm_item_stock, only: :new
  def new
    @pre_order = PreOrder.new
    @payments = Payment.all
    @deliveries = Delivery.all
    if current_user.pre_order == nil
      @shipping_cost = 0
      @fee = 0
    else
      @shipping_cost = current_user.pre_order.delivery.price
      @fee = current_user.pre_order.payment.price
    end
  end

  def create
    PreOrder.where(user_id: current_user.id).first_or_create.update(pre_order_params)
    redirect_to new_order_path
  end

  private def pre_order_params
    params.require(:pre_order).permit(:payment_id, :delivery_id, :hope_day, :hope_hour).merge(user_id: current_user.id)
  end

  def confirm_user_parameter
    if current_user.name.blank? || current_user.phone_num.blank? || current_user.address.blank? || current_user.card_num.blank?
      redirect_to users_path(id: current_user.id, title: "From_order"), alert: "ユーザー情報を入力してください"
    end
  end

  def confirm_item_stock
    current_user.cart.item_nums.each do |item_num|
      if item_num.stock.stock <= 0
        redirect_to carts_path, alert: "商品が完売しました"
      end
    end
  end
end
