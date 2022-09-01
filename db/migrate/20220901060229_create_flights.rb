class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :place_name
      t.string :iata_code
      t.integer :amount
      t.string :outbound_origin_display_code
      t.string :outbound_destination_display_code
      t.timestamp :outbound_departure
      t.timestamp :outbound_arrival
      t.string :outbound_carrier_name
      t.string :inbound_origin_display_code
      t.string :inbound_destination_display_code
      t.timestamp :inbound_depature
      t.timestamp :inbound_arrival
      t.string :inbound_carrier_name
      t.integer :api_flight_id
      t.boolean :booked
      t.boolean :selected
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
