class UserMailer < ApplicationMailer

  default from: "notifications@bluesteel.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://bluesteel.com/login'
    mail to: @user.email, subject: 'Welcome to My Awesome Site'
  end

  def some_other_email( user )
    @user = user
    mail to: @user.email, subject: "Some other email"
  end


end
