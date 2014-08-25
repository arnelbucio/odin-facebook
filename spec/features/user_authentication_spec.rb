require 'rails_helper'

feature 'User authentication' do
  scenario 'user signing in' do
    user = User.create! email: 'user@example.com', password: 'password'

    visit '/'
    click_link 'Sign in'

    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
  end
end
