class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :specialization_id])
    devise_parameter_sanitizer.permit(:account_update, keys:
      %i(full_name, phone_number, avatar, avatar_cache, remove_avatar))
  end
end
