class DropPassenger < ActiveRecord::Migration[6.0]
  def change
    drop_table :passengers
  end
end
