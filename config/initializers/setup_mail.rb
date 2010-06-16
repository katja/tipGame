ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.strato.de",
  :port                 => 25,
  :domain               => "TippSpiel.heroku.com",
  :authentication       => "plain",
  :user_name            => "info@alles-und-nicht-mehr.de",
  :password             => "#{ENV['MAIL_PASSWORD']}",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "TippSpiel.heroku.com"