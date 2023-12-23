class BookingsController < ApplicationController

    
    def index
        @bookings = Booking.all

        respond_to do |format|
            format.html
            format.json { render :json => @bookings }
        end
    end

    def new
        @booking = Booking.new
        @flight = Flight.find_by(id: params[:flight_id])
        @flight.number_of_passengers = params[:number_of_passengers]
        @flight.number_of_passengers.times { @booking.passengers.build }
    end

    def show
        @booking = Booking.find(params[:id])
    end

    def create
        @flight = Flight.find( params[:booking][:flight_id] )
        @booking = @flight.bookings.build(booking_params)

        if @booking.save
            redirect_to booking_path(@booking) ,notice: "You successfully booked your tickets"
        else
            redirect_to :new, status: :unprocessable_entity
        end
    end

    

    def booking_params
        params.require(:booking).permit(:flight_id,passengers_attributes: [:name,:email])
    end


end
