class UsersController < ApplicationController
  before_action :find_user, only: :show
  
  def show
    @movies = []
    bms= @user.bookmarks
    bms.each do |bm|
      @movies << bm.movie
    end
    # @ms = Movie.all
    @movies = Kaminari.paginate_array(@movies).page(params[:page]).per(8)
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(8)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(8)
    render 'show_follow'
  end
  
  private 
  def find_user
    @user = User.find_by id: params[:id]
    if @user.nil?
      flash[:now][:danger] = "User not exist"
      redirect_to admin_root_path
    end
  end
end
