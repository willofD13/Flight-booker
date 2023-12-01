class Flight < ApplicationRecord
    belongs_to :departure_airport, class_name: "Airport"
    belongs_to :arrival_airport, class_name: "Airport"

    def self.search(search)
        if search
            self.where(departure_airport_id: search)
        else
            Flight.all
        end
    end

end
