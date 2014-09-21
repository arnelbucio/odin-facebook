class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.page(params[:page]).per(30)
    @notifications.pending.update_all(seen: true)
  end
end
