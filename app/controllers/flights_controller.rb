class FlightsController < ApplicationController
    def index
        @flights = Flight.search(params[:departure_airport_id],params[:arrival_airport_id],params[:start_datetime])
        @airport_options = Airport.all.map {|a| [a.code,a.id]}
        @number_options = [[1],[2],[3],[4]]
        @date_options = Flight.all.map {|f| [f.start_datetime.strftime('%Y-%m-%d'),f.start_datetime.strftime('%Y-%m-%d %H:%M:%S.%N')]}
    end
end
