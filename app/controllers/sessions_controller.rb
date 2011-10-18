# coding: UTF-8
class SessionsController < ApplicationController
  

  def create  
    if session[:admin]
      redirect_to recipients_path
    else
      flash[:alert] = 'Die Anmeldedaten waren nicht korrekt'
      redirect_to login_path
    end
  end

  def destroy
    session[:admin] = false
    redirect_to new_recipient_path
  end
end
