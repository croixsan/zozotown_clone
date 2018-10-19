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

  def birth_year
    birth_year = [[]]
    limit = (1900..Date.today.year)
    insert = limit.sort.reverse
    insert.each do |year|
      birth_year << [year, year]
    end
  end

  def birth_month
    birth_month = [[]]
    (1..12).each do |month|
      birth_month << [month, month]
    end
  end

  def birth_day
    birth_day = [[]]
    (1..31).each do |day|
      birth_day << [day, day]
    end
  end
end
