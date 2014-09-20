require 'rails_helper'

feature 'Viewing posts' do
  scenario 'viewing feed with friend posts' do
    user = create :user
    friend = create :user
    other_user = create :user
    user.send_friend_request! friend
    friend.accept_friend_request! user
    user_post = create :post, user: user
    friend_post = create :post, user: friend
    other_user_post = create :post, user: other_user

    sign_in user
    visit '/'

    expect(page).to have_content(user_post.content.content)
    expect(page).to have_content(friend_post.content.content)
    expect(page).to_not have_content(other_user_post.content.content)
  end
end
