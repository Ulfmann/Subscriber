class Mailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def notification(recipient)
    mail(:to => recipient.email, :subject => "Hey, flatst ist da!")
  end
end
