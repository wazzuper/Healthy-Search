# frozen_string_literal: true

class Patients::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(full_name email))
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i(full_name email phone_number))
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
