class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    keys =[[:gender], [:post_num], [:address], [:phone_num], [:name], [:birth_year], [:birth_month], [:birth_day]]
    keys.each do |key|
      devise_parameter_sanitizer.permit(:sign_up, keys: key)
    end
  end
end
