# coding: UTF-8
class RecipientsController < ApplicationController

  skip_before_filter :authorize, only: :new

  def index
    
    unless (session[:admin])
      flash[:error] = "Du hast keinen Zugriff auf den Adminbereich!"
      redirect_to new_recipient_path
    end
    
    @recipients = Recipient.all
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(params[:recipient])

    if @recipient.save      
      redirect_to new_recipient_path, notice: 'Danke für Deine Anmeldung!'
    else
      flash[:alert] = "Keine gültige Email-Adresse!"
      render :new
    end
  end

  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy

    redirect_to recipients_path
  end
  
  def notify
    Recipient.delay.send_notifications
    
    redirect_to recipients_path, notice: 'Der Newsletter wird jetzt versendet.'
  end
  
end
