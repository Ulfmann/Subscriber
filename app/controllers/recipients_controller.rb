# coding: UTF-8
class RecipientsController < ApplicationController

  skip_before_filter :authorize, only: :new

  def index
    
    unless (session[:admin])
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
      # treat a duplicate entry differently since we do not
      # want to give away sensitive information.
      taken_message = @recipient.errors.generate_message(:email, :taken)
      
      if @recipient.errors.get(:email).include? taken_message
        flash[:notice] = 'Danke für Deine Anmeldung!'
        redirect_to new_recipient_path
      else
        flash.now[:alert] = @recipient.errors.full_messages.to_sentence
        render :new
      end    
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
