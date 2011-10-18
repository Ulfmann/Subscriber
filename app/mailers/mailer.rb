class Mailer < ActionMailer::Base
  default from: "team@flatst.de"
  
  def notification(recipient)
    mail(to: recipient.email, subject: "Hey, flatst ist da!")
  end
end
