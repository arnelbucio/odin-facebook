require 'rails_helper'

feature 'Creating Posts' do
  scenario 'creating a text post' do
    user = create :user
    sign_in user
    visit '/'

    fill_in 'text_post[content]', with: 'Hello, world!'
    click_button 'Post'

    expect(page).to have_content('Post created')
    expect(page).to have_content('Hello, world')
  end
end
