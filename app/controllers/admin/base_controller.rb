class Admin::BaseController < ApplicationController
  before_action :verify_admin
  layout "admin/application"

  private
  def verify_admin
    redirect_to root_url unless current_user.admin?
  end
end
