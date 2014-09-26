class UserMailer < ActionMailer::Base
  default from: "arnel@arnelbucio.com"

  def welcome_email(user)
    @user = user
    mail to: user.email, subject: 'Welcome to Odinbook!'
  end
end
