class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
    @notifications.pending.update_all(seen: true)
  end
end
