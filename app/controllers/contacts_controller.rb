class ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def contact
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      begin
        EmailerMailer.send_contact_mail(@contact.email,@contact.first_name).deliver!
      rescue
        puts "Mail Not sent!"
      end
      flash[:notice] = t(:success_contact)
    else
      flash[:error] = t(:not_success_contact)
    end
    redirect_to root_url
  end


  private
  def contact_params
    params.permit(:first_name, :last_name, :message, :email, :phone_number)
  end

end
