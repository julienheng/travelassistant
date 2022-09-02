class CreateAccommodations < ActiveRecord::Migration[7.0]
  def change
    create_table :accommodations do |t|
      t.string :entity_id
      t.string :hotel_id
      t.string :name
      t.string :price
      t.float :latitude
      t.float :longitude
      t.string :cheapest_partner
      t.integer :stars
      t.string :hero_image
      t.string :value
      t.string :description
      t.boolean :booked, default: false
      t.boolean :selected, default: false
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
