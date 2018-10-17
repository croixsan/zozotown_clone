class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

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
end
