class Mailer < ActionMailer::Base
  default from: "flatst"
  
  def notification(recipient)
    mail(to: recipient.email, subject: "Hey, flatst ist da!")
  end
end
