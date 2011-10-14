# coding: UTF-8
class SessionsController < ApplicationController
  

  def create  
    if session[:admin]
      redirect_to recipients_path, notice: 'Du bist als Admin eingeloggt.'
    else
      flash[:alert] = 'Die Anmeldedaten waren nicht korrekt'
      redirect_to login_path
    end
  end

  def destroy
    session[:admin] = false
    redirect_to new_recipient_path, notice: 'Du hast dich erfolgreich ausgeloggt.'
  end
end
