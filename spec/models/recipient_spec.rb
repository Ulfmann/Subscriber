# coding: UTF-8
require 'spec_helper'

describe Recipient do
  
  it "should accept a valid email address" do
    Recipient.new(email:'ulf@portner.de').should have(:no).errors_on(:email)
  end
  
  it "should reject invalid email addresses" do
    Recipient.new(email:'ulf portner'   ).should have(1).error_on(:email)
    Recipient.new(email:'ulf@portner@de').should have(1).error_on(:email)
    Recipient.new(email:'Banane'        ).should have(1).error_on(:email)
  end
  
  it "should require an email address" do
    Recipient.new(email:nil ).should have(1).error_on(:email)
    Recipient.new(email:''  ).should have(1).error_on(:email)
    Recipient.new(email:' ' ).should have(1).error_on(:email)
  end

  it "should not allow dublicate emails" do
    Recipient.create!(email:'ulf@portner.de')    
    Recipient.new(email:"ulf@portner.de").should have(1).errors_on(:email)
  end
  
  it "should send a mail to each recipient" do
    a = Recipient.create!(email:"ernie@sesamstrasse.de")
    b = Recipient.create!(email:"bert@sesamstrasse.de")
    c = Recipient.create!(email:"ulf.portner@googlemail.com")
    
    Recipient.send_notifications
    
    [a, b, c].each do |recipient|
      ActionMailer::Base.deliveries.map do |mail|
        mail.To.to_s
      end.should include(recipient.email)
    end
  end
end