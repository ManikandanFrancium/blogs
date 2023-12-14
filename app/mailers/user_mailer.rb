class UserMailer < ApplicationMailer
  default from: 'manikandan0398@gmail.com'

  def welcome_email
    # @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: 'manikandan0398@gmail.com', subject: 'Welcome to coding career')
  end
end
