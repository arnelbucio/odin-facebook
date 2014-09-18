class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    custom_user_params = [:name, :username, :avatar, :avatar_cache, :remove_avatar]
    devise_parameter_sanitizer.for(:sign_up) << custom_user_params
    devise_parameter_sanitizer.for(:account_update) << custom_user_params
  end
end
