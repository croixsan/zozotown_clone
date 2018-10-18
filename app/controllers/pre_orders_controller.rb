class PreOrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    confirm_user_parameter
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
    if current_user.name == nil || current_user.phone_num == nil || current_user.address == nil || current_user.card_num == nil
      redirect_to users_path(id: current_user.id), notice: "ユーザー情報を入力してください"
    end
  end
end
