class UsersController < ApplicationController
  before_action :check_up_on, only: [:index, :edit, :update]
  before_action :check_update, only: [:update_card, :update_mail]
  include UsersHelper
  @@link = ""
  @@order = ""
  def index
    if params[:title] == "From_order"
      @@order = 1
    else
      @@order = 0
    end
    if @@link == 2
      @linkcart = 3
      @@link = 0
      @@order = 1
    else
      @linkcart = 0
    end
  end

  def edit
    @current = User.find(current_user.id)
    @user = User.find(current_user.id)
  end

  def update
    @@link = 2 if @@order == 1
    if @user.update(address_params)
      redirect_to users_path(id: current_user.id), notice: '基本情報を更新しました。'
    else
      redirect_to users_path(id: current_user.id), alert: '更新に失敗しました。'
    end
  end

  def update_card
    @@link = 2 if @@order == 1
    if @user.update(card_params)
      redirect_to users_path(id: current_user.id), notice: 'カード情報を更新しました。'
    else
      redirect_to users_path(id: current_user.id), alert: '更新に失敗しました。'
    end
  end

  def update_mail
    @@link = 2 if @@order == 1
    if @user.update(mail_params)
      redirect_to users_path(id: current_user.id), notice: 'メールアドレスを更新しました。'
    else
      redirect_to users_path(id: current_user.id), alert: '更新に失敗しました。'
    end
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

  def check_up_on
    redirect_to new_user_session_path unless user_signed_in?
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
    end
  end
  def check_update
    redirect_to new_user_session_path unless user_signed_in?
    @user = User.find(params[:user][:id])
    if current_user != @user
      redirect_to root_path
    end
  end
end
