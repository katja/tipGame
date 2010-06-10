class UserMailer < ActionMailer::Base
  default :from => "info@titut.de"
  #default_url_options[:host] = "titut.de"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.mail}>",
         :bcc => "info@titut.de",
         :from => "TipWM",
         :subject => "Willkommen bei TipWM" )
  end
  
  def password_reset_instructions(user)
    @user = user
    @password_reset_url = edit_password_reset_url(user.perishable_token)
    mail(:to => "#{user.name} <#{user.mail}>",
         :bcc => "info@titut.de",
         :from => "Titut",
         :subject => "titut.de - Neues Passwort anlegen")
  end
end
