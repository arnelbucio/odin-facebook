require 'rails_helper'

feature 'Accepting friend request' do
  scenario 'accepting a friend request' do
    user = create :user
    friend = create :user
    friend.send_friend_request! user

    sign_in user
    visit user_path friend
    click_button 'Accept friend request'

    expect(page).to have_content('Friend request accepted')
    expect(page).to have_button('Unfriend')
  end
end
