require 'rails_helper'

feature 'Viewing user profile' do
  scenario 'viewing user profile displays profile information' do
    user = create :user
    post = create :post, user: user

    sign_in user
    visit '/'
    click_link 'Profile'

    expect(page).to have_content(user.name)
    expect(page).to have_content(post.content)
  end
end
