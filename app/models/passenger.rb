class Passenger < ApplicationRecord
    belongs_to :booking
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
