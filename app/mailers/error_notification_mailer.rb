class ErrorNotificationMailer < ApplicationMailer
  def new_error_email
    mail(to: 'chutchinson.252@gmail.com', subject: "CFB app job run failed")
  end
end
