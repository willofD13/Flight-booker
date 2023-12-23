class FlightsController < ApplicationController
    def index
        @flights = Flight.search(params[:departure_airport_id],params[:arrival_airport_id],params[:date])
        @airport_options = Airport.all.map {|a| [a.code,a.id]}
        @number_options = [[1],[2],[3],[4]]
        @dates_options = (Date.today..Date.today+20).map {|date| [date]}

        respond_to do |format|
            format.html
            format.json { render :json => @flights, include: :airports }
        end
    end
end
