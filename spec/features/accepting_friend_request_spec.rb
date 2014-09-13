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

  scenario 'friend receives an accepted friend request notification' do
    user = create :user
    friend = create :user
    friend.send_friend_request! user

    sign_in user
    visit user_path friend
    click_button 'Accept friend request'

    sign_in friend
    visit '/'
    click_link 'Notifications'

    expect(page).to have_content("You are now friends with #{user.name}.")
    expect(page).to have_button('Unfriend')
  end
end
