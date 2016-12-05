class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:followed_id])
    @movies = Movie.reviewed_movie(@user.id).page(params[:page]).per(8)
    notification = Notification.new
    notification.sender_id = current_user.id
    notification.reciver_id = params[:followed_id]
    notification.reciver_status = 0 #hasn't been read
    notification.sender_status = 1 #sended
    notification.content = "follow"
    notification.link = "/"
    notification.save
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
