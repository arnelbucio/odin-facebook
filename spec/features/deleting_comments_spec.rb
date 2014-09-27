require 'rails_helper'

feature 'Deleting comments' do
  scenario 'deleting a comment' do
    user = create :user
    post = create :post, user: user
    comment = create :comment, user: user, commentable: post

    sign_in user
    visit '/'
    find("#comment_#{comment.id} .close").click

    expect(page).to have_content('Comment removed')
    expect(page).to_not have_content(comment.content)
  end
end
