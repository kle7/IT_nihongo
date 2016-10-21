class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up do |user_params|
      user_params.permit :email, :user_name, :password, :password_confirmation,
        :avatar, :avatar_cache, :age, :phone_number
    end
    devise_parameter_sanitizer.permit :account_update do |user_params|
      user_params.permit :email, :user_name, :password, :password_confirmation,
        :current_password, :avatar, :avatar_cache, :remove_avatar, :age, :phone_number
    end
  end

  def current_ability
    namespace = controller_path.split("/").first
    Ability.new current_user, namespace
  end
  
  private
  def after_sign_in_path_for resource
    current_user.admin? ? admin_root_path : root_path
  end
end
