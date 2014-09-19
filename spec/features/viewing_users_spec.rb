require 'rails_helper'

feature 'Viewing users' do
  scenario 'viewing users listing page' do
    user = create :user
    user2 = create :user

    sign_in user
    visit '/'
    click_link 'Users'

    expect(page).to have_content(user.name)
    expect(page).to have_content(user2.name)
  end
end
