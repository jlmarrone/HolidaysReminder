 ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "www.gmail.com",
  :user_name            => "jlmarrone",
  :password             => "holasoygoku",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

#ActionMailer::Base.default_url_options[:host] = "localhost:3000"
