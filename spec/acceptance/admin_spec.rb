require 'acceptance/acceptance_helper'

feature "admin" do
  
  before do
    recipient = Recipient.create!(email:"hello@me.de", betatest:true)
  end

  scenario "Login" do
    
    visit login_path
    fill_in "name", with: "admin"
    fill_in "password", with: "tusDUvt7435"
    
    click_button "Anmelden"
    
    current_path.should eql('/recipients')
  end
  
  scenario "Logout" do
  
    visit login_path
    fill_in "name", with: "admin"
    fill_in "password", with: "tusDUvt7435"
    
    click_button "Anmelden"
    
    click_button "Abmelden"
    
    current_path.should eql('/')
  end
  
  scenario "Delete Subscriber" do
    
    visit login_path
    fill_in "name", with: "admin"
    fill_in "password", with: "tusDUvt7435"
    
    click_button "Anmelden"
     
    click_button "Entfernen"
    
    page.should_not have_content("hello@me.de")
    current_path.should eql('/recipients')
  end
  
end

















