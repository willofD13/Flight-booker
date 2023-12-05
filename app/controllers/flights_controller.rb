class FlightsController < ApplicationController
    def index
        @flights = Flight.search(params[:departure_airport_id],params[:arrival_airport_id],params[:date])
        @airport_options = Airport.all.map {|a| [a.code,a.id]}
        @number_options = [[1],[2],[3],[4]]
    end
end
