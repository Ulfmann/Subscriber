# coding: UTF-8
require 'acceptance/acceptance_helper'

feature "Recipients" do
    
  scenario "adding a new Recipient" do
    
    visit '/'
    fill_in "recipient_email", with: "ulf@flatst.de"
    click_button 'Eintragen'
    
    page.should have_content("Danke für Deine Anmeldung")
  end
  
  scenario "Insert invalid Data" do
    
    visit "/"
    fill_in "recipient_email", with: "crappy nonsense"
    click_button 'Eintragen'
    
    page.should have_content("E-Mail-Adresse ist nicht gültig")
  end
  
  scenario "Insert existing Address" do

    email_address = "hello@me.de"
    
    Recipient.create!(email:email_address, betatest:false)
    
    visit "/"
    fill_in "recipient_email", with:email_address
    
    click_button "Eintragen"
    
    page.should have_content("Danke für Deine Anmeldung!")
  end
  
  scenario "Participating in the beta program" do 
    
    visit "/"
    fill_in "recipient_email", with: "something@awesome.de"
    check "recipient_betatest"
    
    click_button "Eintragen"
    
    page.should have_content("Danke für Deine Anmeldung!")
  end
    
  scenario "Deny access to admin area" do
    
    visit "/recipients"
    current_path.should eql('/')
  end
end
