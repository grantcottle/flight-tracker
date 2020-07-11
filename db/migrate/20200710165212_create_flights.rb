class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :flight_number
      t.references :origin, null: false, foreign_key: {to_table: 'airports'}
      t.references :destination, null: false, foreign_key: {to_table: 'airports'}
      t.date :departure_date
      t.time :departure_time
      t.string :description
      t.integer :duration
      t.integer :stops

      t.timestamps
    end
  end
end
