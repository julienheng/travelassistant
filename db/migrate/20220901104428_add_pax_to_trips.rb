class AddPaxToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :pax, :integer
  end
end
