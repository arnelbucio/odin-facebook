require 'rails_helper'

feature 'Liking comments' do
  scenario 'liking a comment' do
    user = create :user
    post = create :post, user: user
    comment = create :comment, commentable: post

    sign_in user
    visit post_path post
    within("#comment_#{comment.id}") do
      click_link 'Like'
    end

    expect(page).to have_content('Comment liked')
    expect(page).to have_content('1 like')
  end
end
