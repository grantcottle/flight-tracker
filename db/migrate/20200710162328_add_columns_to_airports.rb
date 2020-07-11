# frozen_string_literal: true

class AddColumnsToAirports < ActiveRecord::Migration[6.0]
  def change
    add_column :airports, :city, :string
    add_column :airports, :country, :string
    add_column :airports, :latitude, :decimal
    add_column :airports, :longitude, :decimal
    add_column :airports, :timezone, :string
  end
end
