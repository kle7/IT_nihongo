class NotificationsController < ApplicationController
  def user_update
    count = 0
    notifications = current_user.recived_notifications
    count = notifications.where(reciver_status: 0).count
    respond_to do |format|
      msg = { :count => count}
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def follow_list
    @notifications = current_user.recived_notifications.where.not(reciver_status: 2)
  end

  def show_list
    notifications = current_user.recived_notifications.where.not(reciver_status: 2)
    senders = []
    notifications.each do |n|
      senders.push(n.sender.user_name)
    end
    respond_to do |format|
      msg = {:notifications =>notifications,:senders => senders}
      format.json  { render :json => msg } # don't do msg.to_json
    end
  end

  def seen
    notifications=current_user.recived_notifications.where(reciver_status: 0)
    notifications.each do |n|
      n.reciver_status=1
      n.save
    end
  end
  def accept
    notification = Notification.find(params[:notification_id])
    notification.reciver_status=2;
    notification.save
    n = Notification.new
    n.sender_id = current_user.id
    n.reciver_id = notification.sender_id
    n.reciver_status = 0 #hasn't been read
    n.sender_status = 1 #sended
    n.content = "respone_follow"
    n.link = "accepted"
    n.save
  end

  def decline
    notification = Notification.find(params[:notification_id])
    n = Notification.new
    n.sender_id = current_user.id
    n.reciver_id = notification.sender_id
    n.reciver_status = 0 #hasn't been read
    n.sender_status = 1 #sended
    n.content = "respone_follow"
    n.link = "declined"
    n.save
    notification.destroy
  end
end
