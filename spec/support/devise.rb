include Warden::Test::Helpers

module AuthenticationHelpers
  def sign_in(user)
    login_as user, scope: :user
    user
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :feature
end
