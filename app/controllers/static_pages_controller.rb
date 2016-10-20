class StaticPagesController < ApplicationController
  before_action :check_admin
  def home
  end

  def about
  end

  private 
  def check_admin
    if current_user.admin?
      flash[:danger] = t :not_have_permission
      redirect_to admin_root_path   
    end 
  end
end
