class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery Prepend: true

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email photo bio])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email photo bio])
  end
end
