class UserMailer < ApplicationMailer
  default from: 'noreply.fastfood@gmail.com'
 
  def activation_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
 
end
