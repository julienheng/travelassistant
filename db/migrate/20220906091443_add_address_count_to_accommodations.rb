class AddAddressCountToAccommodations < ActiveRecord::Migration[7.0]
  def change
    add_column :accommodations, :address, :string
    add_column :accommodations, :format_count, :string
  end
end
