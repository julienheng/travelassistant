class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.integer :start_date
      t.integer :end_date
      t.string :location
      t.float :budget
      t.float :total_cost
      t.float :latitude
      t.float :longitude
      t.string :currency
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
