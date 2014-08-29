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
end
