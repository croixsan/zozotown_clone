class OrdersController < ApplicationController
before_action :setup_user
  def index
  end

  def select
    
    @delivery = Delivery.new
    @order = Order.new
    @card = Card.new
    @itemprice = 5500
    @totalprice = 5700
  end

  def registration
    # binding.pry
    @derivery = Delivery.new
    @delivery.create
    @orders = Order.new
    @orders.create
    @cards = Card.new
    @card.create
    redirect_to orders_select
  end

  private

    def delivery_params
    end

    def setup_user
      @user = User.find(1)
    end
end