class CreateAttractions < ActiveRecord::Migration[7.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :address
      t.string :rating
      t.string :category_name
      t.string :price
      t.boolean :booked
      t.boolean :selected
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
