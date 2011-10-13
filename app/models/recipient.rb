class Recipient < ActiveRecord::Base
  
  validates :email, 
            presence:   true,
            uniqueness: true,
            format:     { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, allow_blank: true }

  def self.send_notifications
    all.each do |recipient|
      Mailer.notification(recipient).deliver
    end
  end
end
