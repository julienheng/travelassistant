class FlightsController < ApplicationController
  def new
    @flight = Flight.new
    @flights = Flight.all
    @trip = Trip.find(params[:trip_id])
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
