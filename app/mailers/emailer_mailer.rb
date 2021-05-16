class EmailerMailer < ApplicationMailer
  default :from => 'from@example.com'

  def send_contact_mail(email,user)
    @user = user
    @email = email
    mail( :to => email,:subject => 'AJACKUS Notification' )
  end

end
