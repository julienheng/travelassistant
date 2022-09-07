class AddCuisineToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :serves_cuisine, :string
  end
end
