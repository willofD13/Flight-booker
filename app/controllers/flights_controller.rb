class FlightsController < ApplicationController
    def index
        @flights = Flight.search(params[:departure_airport_id])
        @airport_options = Airport.all.map {|a| [a.code,a.id]}
    end
end
