class UsersController < ApplicationController

  before_action :setup_user

  def index
  end

  def edit
  end

  def update
    @user.update(address_params)
    redirect_to users_index_path
  end

  def update_card
    @user.update(card_params)
    redirect_to users_index_path
  end

  def update_mail
    @user.update(mail_params)
    redirect_to users_index_path
  end

  private

  def address_params
    params.require(:user).permit(:name, :gender, :birth_year, :birth_month, :birth_day, :post_num, :address, :phone_num)
  end

  def mail_params
    params.require(:user).permit(:email)
  end

  def card_params
    params.require(:user).permit(:card_num, :security_code)
  end

  def setup_user
    @user = User.find(current_user.id)
  end

end
