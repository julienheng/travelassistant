class FixName < ActiveRecord::Migration[7.0]
  def change
    rename_column :trips, :location, :origin
  end
end
