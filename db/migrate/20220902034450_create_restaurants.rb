class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street
      t.string :postal_code
      t.integer :price_range
      t.string :longtitude
      t.string :latitude
      t.string :currencies_accepted
      t.float :rating_value
      t.string :main_photo_src
      t.integer :city_id
      t.string :google_place_id
      t.boolean :booked
      t.boolean :selected
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
