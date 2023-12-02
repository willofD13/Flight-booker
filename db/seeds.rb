# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
require 'date'
Flight.delete_all
Airport.delete_all

     Airport.create!([{
      code: "AHN"
     },
    {
      code: "GGW"
    },
    {
      code: "IND"
    },
    {
      code: "SFO"
    },
    {
      code: "NYC"
    }])
    p "created #{Airport.count} airports"

   def flight_creator
    airport_codes = Airport.all.map {|a| a.code }
    airport_pairs = airport_codes.permutation(2).to_a
    time1 = Time.now
    time2 = time1 + (60*60*24*20)

    def airport_finder(airports,time1,time2)
      airports.each do |a|
        a1 = Airport.find_by(code: a[0])
        a2 = Airport.find_by(code: a[1])
        

        flight_creator(a1,a2,date,time)
      end
    end
    
    def flight_creator(departure_airport,arrival_airport,date,time)
        Flight.create!({
        time: ,
        date: , 
        duration: "#{((1..24).to_a).sample} hours",
        departure_airport_id: departure_airport.id,
        arrival_airport_id: arrival_airport.id
        })
    end
  end
  
  first_day = Date.today
  last_day = today + 20

  (first_day..last_day).each do |day|
    flight_creator
  end
   
p "created #{Flight.count} flights"