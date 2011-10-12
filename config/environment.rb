# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Subscriber::Application.initialize!

Subscriber::Application.configure do
  config.action_mailer.delivery_method = :sendmail
end
