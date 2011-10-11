require 'acceptance/acceptance_helper'

feature "Recipients" do
    
    scenario "adding a new Recipient" do
      
      visit '/'
            
      fill_in "E-Mail", with: "ulf@flatst.de"
      
      click_button 'Abschicken'
      
      current_path.should eql('/recipients/new')
    end
end
