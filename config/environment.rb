# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :domain => 'OddJobsNUS.com',
  :authentication => :plain,
  :user_name => Rails.application.secrets.mailer_user,
  :password => Rails.application.secrets.mailer_password,
  :enable_starttls_auto => true
}
