require 'rails_helper'

feature 'Commenting on posts' do
  scenario 'commenting on a post' do
    user = create :user
    post = create :post, user: user

    sign_in user
    visit post_path post
    fill_in 'comment[content]', with: 'This is a comment'
    click_button 'Comment'

    expect(page).to have_content('Comment created')
    expect(page).to have_content('This is a comment')
  end
end
