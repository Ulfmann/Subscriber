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
    
    recipient = Recipient.new(email:"hello@me.de")
    recipient.save
    
    visit "/"
    fill_in "recipient_email", with: "hello@me.de"
    
    click_button "Eintragen"
    
    page.should have_content("Danke für Deine Anmeldung!")
  end
  
  
  scenario "Access Admin Page" do
    
    visit "/recipients"
    page.should have_content("Du hast keinen Zugriff auf den Adminbereich!")
    
  end
end
