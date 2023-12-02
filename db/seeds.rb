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

   today = Date.today
   month = today + 30
   airport_codes = Airport.all.map {|a| a.code }
   airport_pairs = airport_codes.permutation(2).to_a


   def airport_finder(airports,day)
    airports.each do |a|
      a1 = Airport.find_by(code: a[0])
      a2 = Airport.find_by(code: a[1])
      morning = morning_time(day)
      afternoon = afternoon_time(day)

      flight_creator(a1,a2,morning,afternoon)
      flight_creator(a1,a2,morning,afternoon)
    end
   end
  
   def flight_creator(departure_airport,arrival_airport,morning,afternoon)
      Flight.create!({
      start_datetime: Time.at((afternoon.to_f - morning.to_f)*rand + morning.to_f),
      duration: "#{((1..24).to_a).sample} hours",
      departure_airport_id: departure_airport.id,
      arrival_airport_id: arrival_airport.id
      })
   end

   def morning_time(time)
    Faker::Time.between_dates(from: time, to: time, period: :morning)
   end

   def afternoon_time(time)
    Faker::Time.between_dates(from: time, to: time, period: :afternoon)
   end

   (today..month).each do |d|
    airport_finder(airport_pairs,d)
 end

   
p "created #{Flight.count} flights"