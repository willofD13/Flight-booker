class AddNameAndEmailToPassengers < ActiveRecord::Migration[7.1]
  def change
    add_column :passengers, :name, :string
    add_column :passengers ,:email, :string
  end
end
