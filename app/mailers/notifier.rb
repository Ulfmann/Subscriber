class Notifier < ActionMailer::Base
  default :from => "ulf.portner@googlemail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.newsletter.subject
  #
  def newsletter(recipient)
    @greeting = "Hi"

    recipients recipient.email
    from       "ulf.portner@googlemail.com"
    subject    "Dein Newsletter"
  end
end
