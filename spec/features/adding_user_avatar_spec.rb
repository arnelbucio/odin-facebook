require 'rails_helper'

feature 'Adding user avatar' do
  scenario 'adding an avatar' do
    user = create :user

    sign_in user
    visit '/'
    click_link 'Edit Account'
    attach_file 'Avatar', 'spec/support/uploads/avatar.png'
    fill_in 'Current password', with: user.password
    click_button 'Update'

    expect(page).to have_content('Your account has been updated successfully')

    click_link 'Profile'
    user.reload
    expect(page.find('#profile .avatar')['src']).to have_content(user.avatar.small.url)
  end
end
