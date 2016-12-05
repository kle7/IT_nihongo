class NotificationsController < ApplicationController
  def user_update
    count = 0
    # byebug
    notifications = current_user.recived_notifications.where(reciver_status: 0)
    # User.find(3).recived_notifications.where(reciver_status: 0)
    if(user_signed_in?)
      count = notifications.count
    end
    respond_to do |format|
      msg = { :count => count, :notifications =>notifications}
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end
  def form_folow_request
    render "shared/_form_follow_request"
  end
end
