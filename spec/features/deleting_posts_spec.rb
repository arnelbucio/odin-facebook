require 'rails_helper'

feature 'Deleting posts' do
  scenario 'deleting a post' do
    user = create :user
    post = create :post, user: user

    sign_in user
    visit '/'
    find("#post_#{post.id} .close").click

    expect(page).to have_content('Post removed')
    expect(page).to_not have_content(post.content.content)
  end
end
