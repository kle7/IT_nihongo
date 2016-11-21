class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:edit, :update, :destroy, :show]
  
  def index
    @search = User.search params[:q]
    @users = @search.result.page params[:page]
  end

  def edit
    @users = User.all
  end
  
  def show  
  end

  def destroy
    if @user.destroy
      flash[:success] = t "user.deleted"
    else
      flash[:danger] = t "flash.fail"
    end
    redirect_to admin_users_path
  end

  def update
    if @user.update user_params
      flash[:success] = "success"
      redirect_to admin_users_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :user_name, :avatar, :age, :phone_number
  end

  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:danger] = "User not exist"
      redirect_to admin_root_path
    end
  end
end
