require 'acceptance/acceptance_helper'

feature "admin" do
  
  before do
    recipient = Recipient.new(email:"hello@me.de")
    recipient.save
  end

  scenario "Login" do
    
    visit "/"
    
    fill_in "name", with: "admin"
    fill_in "password", with: "root"
    
    click_button "Anmelden"
    
    current_path.should eql('/recipients')
  end
  
  scenario "Logout" do
  
    visit "/recipients"
    click_button "Abmelden"
    
    current_path.should eql('/recipients/new')
  end
  
  scenario "Delete Subscriber" do
    
    visit "/recipients"
    
    click_button "Entfernen"
    
    page.should_not have_content("hello@me.de")
    current_path.should eql('/recipients')
  end
  
  scenario "Edit Subscriber" do
    
    visit "/recipients"
    
    click_link "hello@me.de"
    
    page.should have_content("Adresse bearbeiten")
    fill_in "E-Mail", with: "hello@you.de"
    
    click_button "Abschicken"
    
    current_path.should_not have_content("hello@you.de")
    current_path.should eql('/recipients')
  end
  
  scenario "Sending Mail" do
    
    pending
    
  end
  
end

















