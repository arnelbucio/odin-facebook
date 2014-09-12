require 'rails_helper'

feature 'Sending friend requests' do
  scenario 'sending a friend request to other user' do
    user = create :user
    friend = create :user

    sign_in user
    visit user_path friend
    click_button 'Send friend request'

    expect(page).to have_content('Friend request sent')
    expect(page).to have_button('Cancel friend request')
  end

  scenario 'friend receives a friend request notification' do
    user = create :user
    friend = create :user

    sign_in user
    visit user_path friend
    click_button 'Send friend request'

    sign_in friend
    visit '/'
    click_link 'Notifications'

    expect(page).to have_content("#{user.name} sent a friend request.")
    expect(page).to have_button('Accept friend request')
    expect(page).to have_button('Ignore friend request')
  end
end
