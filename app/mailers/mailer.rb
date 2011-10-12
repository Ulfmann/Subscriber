class Mailer < ActionMailer::Base
  default :from => "from@example.com"
  
  def notification(recipient)
    mail(:to => "ulf.portner@googlemail.com", :subject => "Hey, flatst ist da!")
  end
end
