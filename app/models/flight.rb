require 'date'
class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"
    has_many :bookings, dependent: :destroy

    def self.search(param1,param2,param3)
        if param1
            self.where(departure_airport_id: param1, arrival_airport_id: param2, date: param3)
        else
            Flight.all
        end
    end

end
