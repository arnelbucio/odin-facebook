require 'rails_helper'

feature 'Viewing friends' do
  scenario 'viewing friends' do
    user = create :user
    friend = create :user
    friend2 = create :user
    user.send_friend_request! friend
    friend2.send_friend_request! user
    friend.accept_friend_request! user
    user.accept_friend_request! friend2

    sign_in user
    visit '/'
    click_link 'Friends'

    expect(page).to have_content(friend.name)
    expect(page).to have_content(friend2.name)
  end
end
