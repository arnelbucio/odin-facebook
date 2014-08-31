require 'rails_helper'

feature 'Canceling friend request' do
  scenario 'canceling a friend request' do
    user = create :user
    friend = create :user
    user.send_friend_request!(friend)

    sign_in user
    visit user_path friend
    click_button 'Cancel friend request'

    expect(page).to have_content('Friend request cancelled')
    expect(page).to have_button('Send friend request')
  end
end
