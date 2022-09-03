class RemoveStartDateFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :start_date, :integer
  end
end
