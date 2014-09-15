require 'rails_helper'

feature 'Liking posts' do
  scenario 'liking a post' do
    user = create :user
    post = create :post, user: user

    sign_in user
    visit post_path post
    click_link 'Like'

    expect(page).to have_content('Post liked.')
    expect(page).to have_link('Unlike')
  end

  scenario 'unliking a post' do
    user = create :user
    post = create :post, user: user
    user.like! post

    sign_in user
    visit post_path post
    click_link 'Unlike'

    expect(page).to have_content('Post unliked.')
    expect(page).to have_link('Like')
  end

  scenario 'increments likes count' do
    user = create :user
    user2 = create :user
    post = create :post, user: user

    sign_in user
    visit post_path post
    click_link 'Like'
    expect(page).to have_content('1 like')

    user2.like! post
    visit post_path post
    expect(page).to have_content('2 likes')
  end
end
