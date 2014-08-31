require 'rails_helper'

feature 'Ignoring friend request' do
  scenario 'ignoring a friend request' do
    user = create :user
    friend = create :user
    user.send_friend_request!(friend)

    sign_in friend
    visit user_path user
    click_button 'Ignore friend request'

    expect(page).to have_content('Friend request cancelled.')
    expect(page).to have_button('Send friend request')
  end
end
