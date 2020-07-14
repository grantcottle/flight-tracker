class DropPassanger < ActiveRecord::Migration[6.0]
  def change
    drop_table :passangers
  end
end
