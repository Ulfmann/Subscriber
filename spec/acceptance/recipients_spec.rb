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
    
    page.should have_content("Keine gültige Email-Adresse!")
  end
  
  scenario "Access Admin Page" do
    
    visit "/recipients"
    page.should have_content("Du hast keinen Zugriff auf den Adminbereich!")
    
  end
end
