class OrdersController < ApplicationController
# before_action :setup_user
  def index
  end

  def select
    @derivery = Delivery.new
  end

  def registration
    @derivery = Delivery.new
    @delivery.save
    redirect_to orders_select
  end

  private

    def delivery_params
    end

    # def setup_user
    #   @user = User.find(1)
    # end
end