class Admin::BaseController < ApplicationController
  before_action :verify_admin
  layout "admin/application"

  private
  def verify_admin
    if current_user.nil? || !current_user.admin?
      flash[:info] = "You dont have permission"
      redirect_to root_url
    end
  end
end
