require 'spec_helper'

describe Mailer do
  describe 'notification' do
    
    let(:recipient) { Recipient.new(email:"ulf.portner@googlemail.com") }
    let(:mail) { Mailer.notification(recipient) }
    
    it "should have a subject" do
      mail.subject.should == "Hey, flatst ist da!"
    end
    
    it "should have a recipient" do
      mail.to.should include("ulf.portner@googlemail.com")
      mail.to.should have(1).item
    end
    
    it "should have content" do
      mail.body.encoded.should include("Hallo")
    end
    
    it "should contain a link to flatst" do
      mail.body.encoded.should match("http://flat.st")
    end
    
  end
end