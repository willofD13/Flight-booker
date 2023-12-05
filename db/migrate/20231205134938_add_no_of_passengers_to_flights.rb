class AddNoOfPassengersToFlights < ActiveRecord::Migration[7.1]
  def change
    add_column :flights, :number_of_passengers, :integer
  end
end
