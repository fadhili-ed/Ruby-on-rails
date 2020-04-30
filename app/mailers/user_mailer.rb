# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
  def welcome_email
    attachments.inline['brave.jpg'] = File.read('/brave.jpg')
    @user = params[:user]
    @url  = 'http://example.com/login'
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
  end
end
