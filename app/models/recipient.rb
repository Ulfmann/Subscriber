class Recipient < ActiveRecord::Base
  validates_presence_of :email
  
  def say_hello
    "Moin!"
  end
end
