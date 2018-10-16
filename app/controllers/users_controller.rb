class UsersController < ApplicationController
  before_action :check_up_on
  before_action :setup_user

  def index
  end

  def edit
  end

  def update

    if @user.update(address_params)
      redirect_to users_index_path, notice: '基本情報を更新しました。'
    else
      redirect_to users_index_path, notice: '更新に失敗しました。'
    end
  end

  def update_card

    if @user.update(card_params)
      redirect_to users_index_path, notice: 'カード情報を更新しました。'
    else
      redirect_to users_index_path, notice: '更新に失敗しました。'
    end
  end

  def update_mail

    if @user.update(mail_params)
      redirect_to users_index_path, notice: 'メールアドレスを更新しました。'
    else
      redirect_to users_index_path, notice: '更新に失敗しました。'
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

  def setup_user
    @user = User.find(current_user.id)
  end

  def check_up_on
    render_404 unless user_signed_in?
  end

  def render_404
    render template: 'users/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end
end
