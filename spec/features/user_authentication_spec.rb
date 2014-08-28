require 'rails_helper'

feature 'User authentication' do
  scenario 'user signing in' do
    user = create :user
    visit '/'
    click_link 'Sign in'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content('Signed in successfully.')
  end
end
