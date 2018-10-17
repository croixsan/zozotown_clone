module UsersHelper
  def user_form_method
    if params[:title] == "basic"
      render partial: "users_address"
    elsif params[:title] == "mail"
      render  partial: "users_mail"
    elsif params[:title] == "card"
      render  partial: "users_card"
    elsif params[:title] == "new_card"
      render  partial: "users_card"
    elsif params[:title] == "pass"
      render  partial: "users_pass"
    else
      redirect_to users_path(id: current_user.id)
    end
  end
end
