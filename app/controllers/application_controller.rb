class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  private

  def configure_permitted_parameters
    update_attrs = [:password, :password_confirmation, :current_password, :email, :username]
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
end
