module FriendshipsHelper
  def friend_request_button(friend)
    unless current_user == @user
      return cancel_friend_request_button(@user) if current_user.requested_friends.include?(friend)
      return send_friend_request_button(@user)
    end
  end

  private

  def send_friend_request_button(friend)
    button_to 'Send friend request', friendships_path(friend_id: friend.id),
                                     data: { confirm: 'Are you sure?' }
  end

  def cancel_friend_request_button(friend)
    button_to 'Cancel friend request', friendships_path(friend_id: friend.id),
                                       method: :delete, data: { confirm: 'Are you sure?' }
  end
end
