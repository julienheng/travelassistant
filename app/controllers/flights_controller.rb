class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.save
  end

  private

  def flight_params
    params.require(:flight).permit(:iata_code, :amount, :outbound_origin_display_code,
                                   :outbound_destination_display_code, :outbound_departure,
                                   :outbound_arrival, :outbound_carrier_name, :inbound_origin_display_code,
                                   :inbound_destination_display_code, :inbound_departure,
                                   :inbound_arrival, :inbound_carrier_name, :api_flight_id,
                                   :booked, :selected, :trip_id)
  end
end

#t.string "place_name"
    #t.string "iata_code"
    #t.integer "amount"
    #t.string "outbound_origin_display_code"
    #t.string "outbound_destination_display_code"
    #t.datetime "outbound_departure", precision: nil
    #t.datetime "outbound_arrival", precision: nil
    #t.string "outbound_carrier_name"
    #t.string "inbound_origin_display_code"
    #t.string "inbound_destination_display_code"
    #t.datetime "inbound_departure", precision: nil
    #t.datetime "inbound_arrival", precision: nil
    #t.string "inbound_carrier_name"
    #t.integer "api_flight_id"
    #t.boolean "booked", default: false
    #t.boolean "selected", default: false
    #t.bigint "trip_id", null: false
