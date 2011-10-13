# coding: UTF-8
class RecipientsController < ApplicationController

  skip_before_filter :authorize, only: :new

  def index
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
      flash[:alert] = "Hoppla!"
      render :new
    end
  end

  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy

    redirect_to recipients_path
  end
  
  def notify
    puts params[:newsletter]
    Recipient.send_later(:send_notifications)
    
    render "mailer/notification.text.erb"
  end
  
end
