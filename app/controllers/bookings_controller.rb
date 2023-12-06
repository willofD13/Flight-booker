class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find_by(time: params[:time],date: params[:date],departure_airport_id: params[:departure_airport],
        arrival_airport_id: params[:arrival_airport],duration: params[:duration])
        @flight.number_of_passengers = params[:number_of_passengers]
        @flight.number_of_passengers.times do
            @booking.passengers.build
        end
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save
            redirect_to flights_path
        else
            redirect_to :new, status: :unprocessable_entity
        end
    end

    def booking_params
        params.require(:booking).permit(:flight_id,passengers_attributes: [:name,:email])
    end
end
