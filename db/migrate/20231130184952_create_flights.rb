class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.datetime :start_datetime
      t.string :duration

      t.timestamps
    end
  end
end
