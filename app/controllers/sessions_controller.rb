class SessionsController < ApplicationController
  
  
  def new
  end

  def create  
    if session[:admin]
      redirect_to recipients_path
    else
      redirect_to new_recipients_path
    end
  end

  def destroy
    session[:admin] = false
    redirect_to recipients_url
  end
end
