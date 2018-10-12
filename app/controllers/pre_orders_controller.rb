class PreOrdersController < ApplicationController
  def new
    @pre_order = PreOrder.new
    @payments = Payment.all
    @deliveries = Delivery.all
  end

  def create
    PreOrder.where(user_id: current_user.id).first_or_create.update(pre_order_params)
    redirect_to new_order_path
  end

  private def pre_order_params
    params.require(:pre_order).permit(:payment_id, :delivery_id, :hope_day, :hope_hour).merge(user_id: current_user.id)
  end
end
