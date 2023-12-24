class Booking < ApplicationRecord
    belongs_to :flight 
    has_many :passengers, dependent: :destroy
    accepts_nested_attributes_for :passengers, allow_destroy: true

    def as_json(options={})
        {:id => self.id,
         :passengers => self.passengers
        }
    end 
end
