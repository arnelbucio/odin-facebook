require 'rails_helper'

feature 'Creating Posts' do
  scenario 'creating a text post' do
    user = create :user
    sign_in user
    visit '/'

    fill_in 'text_post[content]', with: 'Hello, world!'
    within('.new_text_post') do
      click_button 'Post'
    end

    expect(page).to have_content('Post created')
    expect(page).to have_content('Hello, world')
  end

  scenario 'creating a photo post' do
    user = create :user
    sign_in user
    visit '/'

    attach_file 'photo_post[photo]', 'spec/support/uploads/kitten.jpg'
    within('.new_photo_post') do
      click_button 'Post'
    end

    expect(page).to have_content('Post created')
    expect(page.find('.photo')['src']).to have_content('kitten.jpg')
  end
end
