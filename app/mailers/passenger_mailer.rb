class PassengerMailer < ApplicationMailer
    default from: 'notifications@example.com'

  def welcome_email
    @passenger = 
    mail(to: @passenger.email, subject: 'Welcome to My Awesome Site')
  end
end
