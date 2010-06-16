class UserMailer < ActionMailer::Base
  default :from => "info@alles-und-nicht-mehr.de"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.mail}>",
         :bcc => "info@alles-und-nicht-mehr.de",
         :from => "TippSpiel <info@alles-und-nicht-mehr.de>",
         :subject => "Willkommen bei TipWM" )
  end
  
  def password_reset_instructions(user)
    @user = user
    @password_reset_url = edit_password_reset_url(user.perishable_token)
    mail(:to => "#{user.name} <#{user.mail}>",
         :bcc => "info@alles-und-nicht-mehr.de",
         :from => "Tippspiel",
         :subject => "TippSpiel.de - Neues Passwort anlegen")
  end
end
