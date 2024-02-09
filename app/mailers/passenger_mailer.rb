class PassengerMailer < ApplicationMailer
    default from: 'odinflightbooker@gmail.com'

  def welcome_email
    @passenger = params[:passenger]
    attachments.inline['airplane.jpeg'] = File.read('app/assets/images/airplane.jpeg')
    mail(to: @passenger.email, subject: 'You have successfully booked your tickets!')
  end
end
