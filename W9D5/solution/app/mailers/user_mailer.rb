class UserMailer < ApplicationMailer
  default from: 'bee@hegelocats.com'

  def welcome_email(user)
    @user = user
    @url = 'http://hegelocats.com/login'
    mail(to: 'everybody@appacademy.io', subject: 'Welcome to Hegelocats!')
  end
end
