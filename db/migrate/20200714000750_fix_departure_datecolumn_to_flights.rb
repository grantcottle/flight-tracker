class FixDepartureDatecolumnToFlights < ActiveRecord::Migration[6.0]
  def change
    remove_column :flights, :departure_time
    change_column :flights, :departure_date, :datetime
  end
end
