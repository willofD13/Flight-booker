class RemoveDateTimeFromFlights < ActiveRecord::Migration[7.1]
  def change
    remove_column :flights, :start_datetime, :datetime
  end
end
