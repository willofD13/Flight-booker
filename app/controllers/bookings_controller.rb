class BookingsController < ApplicationController
    def new
        @booking = Booking.new
        @flight = Flight.find_by(id: params[:flight_id])
        @flight.number_of_passengers = params[:number_of_passengers]
        @flight.number_of_passengers.times { @booking.passengers.build }
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
