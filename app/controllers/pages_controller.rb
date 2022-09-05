require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    #raise
  end

  def loading; end

  def generate
    # call iata code for origin and destination from location param in trip
    # pass iata code into api
    @trip = Trip.find(params[:trip_id])
    @data = {
      flights: find_flight,
      accomms: find_accomms,
      activities: {
        restaurants: find_restaurants,
        attractions: find_attractions
      }
    }
    session[:trip_data] = @data
    unless @data
      flash[:alert] = 'Flight not found'
    end

    redirect_to new_trip_flight_path(@trip)
  end

  def dashboard
  end

  def activities
  end

  private

  def find_flight
    #url = URI("https://skyscanner50.p.rapidapi.com/api/v1/searchFlights?origin=LHR&destination=SIN&date=2022-09-30&returnDate=2022-10-30&adults=1&currency=USD&countryCode=US&market=en-US")

    #http = Net::HTTP.new(url.host, url.port)
    #http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #request = Net::HTTP::Get.new(url)
    #request["X-RapidAPI-Key"] = 'f74f82968cmsh0a2149632e17456p1eaf7djsn1436ce748251'
    #request["X-RapidAPI-Host"] = 'skyscanner50.p.rapidapi.com'

    #response = http.request(request)
    #user_flights_data = response.read_body

    #user_flights_data_json = JSON.parse(user_flights_data)
    #user_flight_data_json = user_flights_data_json["data"].first(3)

    user_flight_data_json = [{"id"=>"13554-2209301100--32080-1-16292-2210011040|16292-2210301930--32080-1-13554-2210310535", "price"=>{"amount"=>983.46, "update_status"=>"current", "last_updated"=>"2022-09-04T02:04:00", "quote_age"=>45, "score"=>7.84173, "transfer_type"=>"MANAGED"}, "legs"=>[{"id"=>"13554-2209301100--32080-1-16292-2210011040", "origin"=>{"id"=>13554, "entity_id"=>95565050, "alt_id"=>"LHR", "parent_id"=>4698, "parent_entity_id"=>27544008, "name"=>"London Heathrow", "type"=>"Airport", "display_code"=>"LHR"}, "destination"=>{"id"=>16292, "entity_id"=>95673375, "alt_id"=>"SIN", "parent_id"=>7101, "parent_entity_id"=>27546111, "name"=>"Singapore Changi", "type"=>"Airport", "display_code"=>"SIN"}, "departure"=>"2022-09-30T11:00:00", "arrival"=>"2022-10-01T10:40:00", "duration"=>1000, "carriers"=>[{"id"=>-32080, "name"=>"Malaysia Airlines", "alt_id"=>"MH", "display_code"=>"MH", "display_code_type"=>"IATA", "alliance"=>-32000}], "stop_count"=>1, "stops"=>[{"id"=>13311, "entity_id"=>95673456, "alt_id"=>"KUL", "parent_id"=>4350, "parent_entity_id"=>27543923, "name"=>"Kuala Lumpur International", "type"=>"Airport", "display_code"=>"KUL"}]}, {"id"=>"16292-2210301930--32080-1-13554-2210310535", "origin"=>{"id"=>16292, "entity_id"=>95673375, "alt_id"=>"SIN", "parent_id"=>7101, "parent_entity_id"=>27546111, "name"=>"Singapore Changi", "type"=>"Airport", "display_code"=>"SIN"}, "destination"=>{"id"=>13554, "entity_id"=>95565050, "alt_id"=>"LHR", "parent_id"=>4698, "parent_entity_id"=>27544008, "name"=>"London Heathrow", "type"=>"Airport", "display_code"=>"LHR"}, "departure"=>"2022-10-30T19:30:00", "arrival"=>"2022-10-31T05:35:00", "duration"=>1085, "carriers"=>[{"id"=>-32080, "name"=>"Malaysia Airlines", "alt_id"=>"MH", "display_code"=>"MH", "display_code_type"=>"IATA", "alliance"=>-32000}], "stop_count"=>1, "stops"=>[{"id"=>13311, "entity_id"=>95673456, "alt_id"=>"KUL", "parent_id"=>4350, "parent_entity_id"=>27543923, "name"=>"Kuala Lumpur International", "type"=>"Airport", "display_code"=>"KUL"}]}], "is_eco_contender"=>true, "eco_contender_delta"=>19.061201, "score"=>7.82998, "totalDuration"=>2085}, {"id"=>"13554-2209302130--31821-1-16292-2210021855|16292-2210301950--31821-1-13554-2210311910", "price"=>{"amount"=>1051.29, "update_status"=>"current", "last_updated"=>"2022-09-04T02:04:00", "quote_age"=>45, "score"=>3.65474, "transfer_type"=>"MANAGED"}, "legs"=>[{"id"=>"13554-2209302130--31821-1-16292-2210021855", "origin"=>{"id"=>13554, "entity_id"=>95565050, "alt_id"=>"LHR", "parent_id"=>4698, "parent_entity_id"=>27544008, "name"=>"London Heathrow", "type"=>"Airport", "display_code"=>"LHR"}, "destination"=>{"id"=>16292, "entity_id"=>95673375, "alt_id"=>"SIN", "parent_id"=>7101, "parent_entity_id"=>27546111, "name"=>"Singapore Changi", "type"=>"Airport", "display_code"=>"SIN"}, "departure"=>"2022-09-30T21:30:00", "arrival"=>"2022-10-02T18:55:00", "duration"=>2305, "carriers"=>[{"id"=>-31821, "name"=>"SriLankan Airlines", "alt_id"=>"UL", "display_code"=>"UL", "display_code_type"=>"IATA", "alliance"=>-32000}], "stop_count"=>1, "stops"=>[{"id"=>10610, "entity_id"=>95673656, "alt_id"=>"CMB", "parent_id"=>1714, "parent_entity_id"=>27539843, "name"=>"Colombo Bandaranayake", "type"=>"Airport", "display_code"=>"CMB"}]}, {"id"=>"16292-2210301950--31821-1-13554-2210311910", "origin"=>{"id"=>16292, "entity_id"=>95673375, "alt_id"=>"SIN", "parent_id"=>7101, "parent_entity_id"=>27546111, "name"=>"Singapore Changi", "type"=>"Airport", "display_code"=>"SIN"}, "destination"=>{"id"=>13554, "entity_id"=>95565050, "alt_id"=>"LHR", "parent_id"=>4698, "parent_entity_id"=>27544008, "name"=>"London Heathrow", "type"=>"Airport", "display_code"=>"LHR"}, "departure"=>"2022-10-30T19:50:00", "arrival"=>"2022-10-31T19:10:00", "duration"=>1880, "carriers"=>[{"id"=>-31821, "name"=>"SriLankan Airlines", "alt_id"=>"UL", "display_code"=>"UL", "display_code_type"=>"IATA", "alliance"=>-32000}], "stop_count"=>1, "stops"=>[{"id"=>10610, "entity_id"=>95673656, "alt_id"=>"CMB", "parent_id"=>1714, "parent_entity_id"=>27539843, "name"=>"Colombo Bandaranayake", "type"=>"Airport", "display_code"=>"CMB"}]}], "is_eco_contender"=>false, "eco_contender_delta"=>0.7343888, "score"=>3.64927, "totalDuration"=>4185}, {"id"=>"13554-2209300645--32480,-31821-3-16292-2210011410|16292-2210302340--32611,-32080-1-13554-2210311525", "price"=>{"amount"=>1070.21, "update_status"=>"pending", "last_updated"=>"2022-09-04T02:31:27", "quote_age"=>18, "score"=>4.72576, "transfer_type"=>"PROTECTED_SELF_TRANSFER"}, "legs"=>[{"id"=>"13554-2209300645--32480,-31821-3-16292-2210011410", "origin"=>{"id"=>13554, "entity_id"=>95565050, "alt_id"=>"LHR", "parent_id"=>4698, "parent_entity_id"=>27544008, "name"=>"London Heathrow", "type"=>"Airport", "display_code"=>"LHR"}, "destination"=>{"id"=>16292, "entity_id"=>95673375, "alt_id"=>"SIN", "parent_id"=>7101, "parent_entity_id"=>27546111, "name"=>"Singapore Changi", "type"=>"Airport", "display_code"=>"SIN"}, "departure"=>"2022-09-30T06:45:00", "arrival"=>"2022-10-01T14:10:00", "duration"=>1465, "carriers"=>[{"id"=>-32480, "name"=>"British Airways", "alt_id"=>"BA", "display_code"=>"BA", "display_code_type"=>"IATA", "alliance"=>-32000}, {"id"=>-31821, "name"=>"SriLankan Airlines", "alt_id"=>"UL", "display_code"=>"UL", "display_code_type"=>"IATA", "alliance"=>-32000}], "stop_count"=>3, "stops"=>[{"id"=>12015, "entity_id"=>95674055, "alt_id"=>"GVA", "parent_id"=>2835, "parent_entity_id"=>33735985, "name"=>"Geneva", "type"=>"Airport", "display_code"=>"GVA"}, {"id"=>9618, "entity_id"=>95673509, "alt_id"=>"AUH", "parent_id"=>676, "parent_entity_id"=>27548192, "name"=>"Abu Dhabi International", "type"=>"Airport", "display_code"=>"AUH"}, {"id"=>10610, "entity_id"=>95673656, "alt_id"=>"CMB", "parent_id"=>1714, "parent_entity_id"=>27539843, "name"=>"Colombo Bandaranayake", "type"=>"Airport", "display_code"=>"CMB"}]}, {"id"=>"16292-2210302340--32611,-32080-1-13554-2210311525", "origin"=>{"id"=>16292, "entity_id"=>95673375, "alt_id"=>"SIN", "parent_id"=>7101, "parent_entity_id"=>27546111, "name"=>"Singapore Changi", "type"=>"Airport", "display_code"=>"SIN"}, "destination"=>{"id"=>13554, "entity_id"=>95565050, "alt_id"=>"LHR", "parent_id"=>4698, "parent_entity_id"=>27544008, "name"=>"London Heathrow", "type"=>"Airport", "display_code"=>"LHR"}, "departure"=>"2022-10-30T23:40:00", "arrival"=>"2022-10-31T15:25:00", "duration"=>1425, "carriers"=>[{"id"=>-32611, "name"=>"AirAsia", "alt_id"=>"AK", "display_code"=>"AK", "display_code_type"=>"IATA", "brand"=>-31992}, {"id"=>-32080, "name"=>"Malaysia Airlines", "alt_id"=>"MH", "display_code"=>"MH", "display_code_type"=>"IATA", "alliance"=>-32000}], "stop_count"=>1, "stops"=>[{"id"=>13311, "entity_id"=>95673456, "alt_id"=>"KUL", "parent_id"=>4350, "parent_entity_id"=>27543923, "name"=>"Kuala Lumpur International", "type"=>"Airport", "display_code"=>"KUL"}]}], "is_eco_contender"=>false, "eco_contender_delta"=>0, "score"=>4.71868, "totalDuration"=>2890}]

    flight_array = []
    user_flight_data_json.each do |flight|
      flight_array << {
                        amount: flight["price"]["amount"],
                        outbound_origin_display_code: flight["legs"][0]["origin"]["display_code"],
                        outbound_destination_display_code: flight["legs"][0]["destination"]["display_code"],
                        outbound_departure: flight["legs"][0]["departure"],
                        outbound_arrival: flight["legs"][0]["arrival"],
                        outbound_carrier_name: flight["legs"][0]["carriers"][0]["name"],
                        inbound_origin_display_code: flight["legs"][1]["origin"]["display_code"],
                        inbound_destination_display_code: flight["legs"][1]["destination"]["display_code"],
                        inbound_departure: flight["legs"][1]["departure"],
                        inbound_arrival: flight["legs"][1]["arrival"],
                        inbound_carrier_name: flight["legs"][1]["carriers"][0]["name"],
                        api_flight_id: flight["id"]
                        }
    end
    flight_array
  end

  def find_accomms
    #search place API to get entity ID
    #url = URI("https://skyscanner50.p.rapidapi.com/api/v1/searchPlace?query=london")

    #http = Net::HTTP.new(url.host, url.port)
    #http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #request = Net::HTTP::Get.new(url)
    #request["X-RapidAPI-Key"] = 'ac49dd4730msh08ae8f552f388afp1aadd1jsn9b400b1d9b91'
    #request["X-RapidAPI-Host"] = 'skyscanner50.p.rapidapi.com'

    #response = http.request(request)
    #user_place_data = response.read_body
    #user_place_data_json = JSON.parse(user_place_data)
    #user_place_data_json = user_place_data_json["data"].first
    #entityid = ?

    #search hotel API
    #url = URI("https://skyscanner50.p.rapidapi.com/api/v1/searchHotel?entityId=%3CREQUIRED%3E&checkin=%3CREQUIRED%3E&checkout=%3CREQUIRED%3E&waitTime=2000&currency=USD&countryCode=US&market=en-US")

    #http = Net::HTTP.new(url.host, url.port)
    #http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #request = Net::HTTP::Get.new(url)
    #request["X-RapidAPI-Key"] = 'ac49dd4730msh08ae8f552f388afp1aadd1jsn9b400b1d9b91'
    #request["X-RapidAPI-Host"] = 'skyscanner50.p.rapidapi.com'

    #response = http.request(request)
    #user_accomms_data = response.read_body
    #user_accomms_data_json = JSON.parse(user_accomms_data)
    #user_accomms_data = user_accomms_data_json["data"].first

    #user_accomms_data = {
    #  entity_id: ,
    #  hotel_id: ,
    #  name: ,
    #  price: ,
    #  latitude: ,
    #  longitude: ,
    #  cheapest_partner: ,
    #  stars: ,
    #  hero_image: ,
    #  value: ,
    #  description: ,
    #}

    #user_accomms_data = {
      #entity_id: ,
      #hotel_id: ,
      #name: ,
      #price: ,
      #latitude: ,
      #longitude: ,
      #cheapest_partner: ,
      #stars: ,
      #hero_image: ,
      #value: ,
      #description: ,
    #}
  end

  def find_restaurants
  end

  def find_attractions
  end
end
