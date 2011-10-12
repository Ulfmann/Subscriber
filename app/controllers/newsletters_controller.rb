class NewslettersController < ApplicationController
  
  def notify
    puts "it works"
    puts params[:newsletter]

  end
  
end