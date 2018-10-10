class PreOrdersController < ApplicationController
  def new
    @pre_order = PreOrder.new
    @payments = Payment.all
    @deliveries = Delivery.all
  end

  def create
    if current_user.pre_order == nil
      PreOrder.create(pre_order_params)
    end
  end

  private def pre_order_params
    params.require(:pre_order).permit(:payment_id, :delivery_id).merge(user_id: current_user.id)
  end
end
