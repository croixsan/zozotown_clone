class PreOrdersController < ApplicationController
  def new
    @pre_order = PreOrder.new
    @payments = Payment.all
    @deliveries = Delivery.all
  end

  def create
  end
end
