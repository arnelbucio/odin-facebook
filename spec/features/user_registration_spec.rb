require 'rails_helper'

feature 'User Registration' do
  scenario 'user signing up' do
    visit '/'
    click_link 'Sign up', match: :first

    fill_in 'Name', with: 'Juan dela Cruz'
    fill_in 'Username', with: 'juan'
    fill_in 'Email', with: 'juan@example.com'
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully')
  end
end
