if Rails.env.development?
  Actionmailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        "smtp.sendgrid.net",
    port:           "587", 
    authentication: :plain,
    user_name:      ENV["SEND_USERNAME"],
    password:       ENV["SEND_PASSWORD"], 
    domain:         "heroku.com",
    enable_starttls_auto: true 
  }
end