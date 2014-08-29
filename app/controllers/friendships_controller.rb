class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])

    if current_user.send_friend_request!(friend)
      redirect_to user_path(friend), notice: 'Friend request sent.'
    else
      redirect_to user_path(friend), alert: 'Cannot send friend request to this user.'
    end
  end
end
