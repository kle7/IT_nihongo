class UsersController < ApplicationController
  before_action :find_user

  def show
  end

  private
  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = t "user.empty"
      redirect_to admin_root_path
    end
  end
end
