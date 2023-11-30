# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
require 'date'
Airport.delete_all

     Airport.create!([{
      code: "[AHN]"
     },
    {
      code: "[GGW]"
    },
    {
      code: "[IND]"
    },
    {
      code: "[SFO]"
    },
    {
      code: "[NYC]"
    }])

   p "created #{Airport.count} airports"

  Flight.delete_all

  Flight.create!([{
    start_datetime: DateTime.new(2023,12,30,16,00,00),
    duration: "3,5h",
    departure_airport_id: 31,
    arrival_airport_id: 32
  },
  {
    start_datetime: DateTime.new(2024,2,23,12,00,00),
    duration: "12,5h",
    departure_airport_id: 33,
    arrival_airport_id: 34
  },
  {
    start_datetime: DateTime.new(2024,1,30,13,00,00),
    duration: "5h 5m",
    departure_airport_id: 35,
    arrival_airport_id: 34
  }])

p "created #{Flight.count} flights"