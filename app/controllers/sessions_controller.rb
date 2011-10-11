class SessionsController < ApplicationController
  
  
  def new
  end

  def create  
    if session[:admin]
      redirect_to recipients_path
    else
      redirect_to new_recipient_path
    end
  end

  def destroy
    session[:admin] = false
    redirect_to new_recipient_path
  end
end
