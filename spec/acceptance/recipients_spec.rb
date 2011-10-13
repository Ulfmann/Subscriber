# coding: UTF-8
require 'acceptance/acceptance_helper'

feature "Recipients" do
    
  scenario "adding a new Recipient" do
    
    visit '/'
    fill_in "E-Mail", with: "ulf@flatst.de"
    click_button 'Abschicken'
    
    page.should have_content("Danke für Deine Anmeldung")
  end
  
  scenario "Insert invalid Data" do
    
    visit "/"
    fill_in "E-Mail", with: "crappy nonsense"
    click_button 'Abschicken'
    
    page.should have_content("Hoppla!")
  end
end
