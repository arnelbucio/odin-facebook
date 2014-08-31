module FriendshipsHelper
  def friend_request_button(friend)
    unless current_user == @user
      return accept_or_ignore_friend_request_link(@user) if current_user.pending_friends.include?(friend)
      return cancel_friend_request_button(@user) if current_user.requested_friends.include?(friend)
      return unfriend_user_button(@user) if current_user.friends.include?(friend)
      return send_friend_request_button(@user)
    end
  end

  private

  def send_friend_request_button(friend)
    button_to 'Send friend request', friendships_path(friend_id: friend.id),
                                     data: { confirm: 'Are you sure?' }
  end

  def cancel_friend_request_button(friend)
    button_to 'Cancel friend request', friendship_path(friend_id: friend.id),
                                       method: :delete, data: { confirm: 'Are you sure?' }
  end

  def accept_or_ignore_friend_request_link(friend)
    capture do
      concat button_to('Accept friend request', accept_friendship_path(friend_id: friend.id), method: :patch, data: { confirm: 'Are you sure?' })
      concat ' / '
      concat button_to('Ignore friend request', friendship_path(friend_id: friend.id), method: :delete, data: { confirm: 'Are you sure?' })
    end
  end

  def unfriend_user_button(friend)
    button_to 'Unfriend', friendship_path(friend_id: friend.id),
                          method: :delete, data: { confirm: 'Are you sure?' }
  end
end
