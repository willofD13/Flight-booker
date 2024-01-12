class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

  def welcome_email
    @passenger = params[:passenger]
    mail(to: @passenger.email, subject: 'You have successfully booked your tickets!')
  end
end
