class RemoveEndDateFromTrips < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :end_date, :integer
  end
end
