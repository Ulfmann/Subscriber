require 'spec_helper'

describe "Recipient" do
  
  it "should say Hello" do
    @recipient = Recipient.new
    greeting = @recipient.say_hello
    greeting.should eql("Moin!")
  end
  it "should validate email address" do
    @recipient = Recipient.new(email: "foo@bar.de")
    @recipient.email.should be_present
  end
end