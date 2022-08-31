class CreateCompanions < ActiveRecord::Migration[7.0]
  def change
    create_table :companions do |t|
      t.string :name
      t.integer :age
      t.string :type
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
