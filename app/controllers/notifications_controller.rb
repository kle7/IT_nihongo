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
  end

  def decline
    notification = Notification.find(params[:notification_id])
    notification.destroy
  end
end
