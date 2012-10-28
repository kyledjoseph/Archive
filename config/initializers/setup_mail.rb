ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "itemnation.com",
  :user_name            => "share@itemnation.com",
  :password             => "Sh@ring12",
  :authentication       => "login",
  :enable_starttls_auto => true
}