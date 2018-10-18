class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  # rescue_from ActiveRecord::RecordNotFound, with: :render_404
  # rescue_from ActionController::RoutingError, with: :render_404

  # def render_404(exception = nil)
  #   if exception
  #     logger.info "Rendering 404 with exception: #{exception.message}"
  #   end
  #   render template: "users/error_404", status: 404, layout: 'application'
  # end

  # rootesも一緒に外す

  protected

  def configure_permitted_parameters
    keys =[[:gender], [:post_num], [:address], [:phone_num], [:name], [:birth_year], [:birth_month], [:birth_day]]
    keys.each do |key|
      devise_parameter_sanitizer.permit(:sign_up, keys: key)
    end
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      username == 'admin' && password == '2222'
    end
  end

  def production?
    Rails.env.production?
  end
end
