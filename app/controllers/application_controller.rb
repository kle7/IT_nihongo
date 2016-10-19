class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_premitted_parameters, if: :devise_controller?
  def current_ability
    namespace = controller_path.split("/").first
    Ability.new current_user, namespace
  end
  
  private
  def after_sign_in_path_for resource
    current_user.admin? ? admin_root_path : root_path
  end
  protected
    def configure_premitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name])
  end
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up).push(:user_name)
  # end
  # def configure_premitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :user_name
  #   devise_parameter_sanitizer.for(:account_update) << :user_name
  #   devise_parameter_sanitizer.for(:account_update) << :avatar
  # end

end
