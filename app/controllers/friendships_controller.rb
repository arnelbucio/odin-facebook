class FriendshipsController < ApplicationController
  before_action :set_friend

  def create
    if current_user.send_friend_request!(@friend)
      redirect_to @friend, notice: 'Friend request sent.'
    else
      redirect_to @friend, alert: 'Cannot send friend request to this user.'
    end
  end

  def accept
    if current_user.accept_friend_request!(@friend)
      redirect_to @friend, notice: 'Friend request accepted.'
    else
      redirect_to @friend, notice: 'Friend request not found.'
    end
  end

  private

  def set_friend
    @friend = User.find(params[:friend_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'User not found.'
  end
end
