require 'spec_helper'

describe "Recipients" do
  
  before do
    
    @subscriber = [
      Recipient.new(email: "ernie@sesamstreet.com"),
      Recipient.new(email: "bert@sesamstreet.com")
    ]
    
  end
  
  context "subscribing" do
    it "should add a new Recipient" do
      recipient = Recipient.new
    
      recipient.save
      @subscriber << recipient
      
      @subscriber.should have(3).items
    end
  end
  
  context "logging in" do
    
    it "accepts admin login" do
      name = "admin"
      password = "root"
      
      #session[:admin].should_be true
    end
    
    it "should not accept invalid inputs" do
      name = "foo"
      password = "bar"
      # should have 2 errors
      # pending
    end
    
    it "should list all recipients" do
      get '/recipients'
      
      @subscriber.should have(2).items
    end
  end
  
end