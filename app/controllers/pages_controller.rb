require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    #raise
  end

  def new
    if current_page?(new_trip_path)
      render 'trips/new_second'
    end
  end

  def loading; end

  def generate
    # call iata code for origin and destination from location param in trip
    # pass iata code into api
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
    redirect_to new_trip_flight_path(1)
  end

  def dashboard
  end

  private

  def find_flight
    #url = URI("https://skyscanner50.p.rapidapi.com/api/v1/searchFlights?origin=LHR&destination=SIN&date=2022-09-30&returnDate=2022-10-30&adults=1&currency=USD&countryCode=US&market=en-US")

    #http = Net::HTTP.new(url.host, url.port)
    #http.use_ssl = true
    #http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    #request = Net::HTTP::Get.new(url)
    #request["X-RapidAPI-Key"] = 'ac49dd4730msh08ae8f552f388afp1aadd1jsn9b400b1d9b91'
    #request["X-RapidAPI-Host"] = 'skyscanner50.p.rapidapi.com'

    #response = http.request(request)
    #user_flights_data = response.read_body

    #user_flights_data_json = JSON.parse(user_flights_data)
    #user_flight_data_json = user_flights_data_json["data"].first

    #user_flight_data = {
      #amount: user_flight_data_json["price"]["amount"],
      #outbound_origin_display_code: user_flight_data_json["legs"][0]["origin"]["display_code"],
      #outbound_destination_display_code: user_flight_data_json["legs"][0]["destination"]["display_code"],
      #outbound_departure: user_flight_data_json["legs"][0]["departure"],
      #outbound_arrival: user_flight_data_json["legs"][0]["arrival"],
      #outbound_carrier_name: user_flight_data_json["legs"][0]["carriers"][0]["name"],
      #inbound_origin_display_code: user_flight_data_json["legs"][1]["origin"]["display_code"],
      #inbound_destination_display_code: user_flight_data_json["legs"][1]["destination"]["display_code"],
      #inbound_departure: user_flight_data_json["legs"][1]["departure"],
      #inbound_arrival: user_flight_data_json["legs"][1]["arrival"],
      #inbound_carrier_name: user_flight_data_json["legs"][1]["carriers"][0]["name"],
      #api_flight_id: user_flight_data_json["id"]
    #}

    user_flight_data = {
      amount: 932.89,
      outbound_origin_display_code: "SIN",
      outbound_destination_display_code: "LHR",
      outbound_departure: "2022-09-30T17:15:00",
      outbound_arrival: "2022-10-01T05:55:00",
      outbound_carrier_name: "Malaysia Airlines",
      inbound_origin_display_code: "LHR",
      inbound_destination_display_code: "SIN",
      inbound_departure: "2022-10-30T10:25:00",
      inbound_arrival: "2022-10-31T10:20:00",
      inbound_carrier_name: "Malaysia Airlines",
      api_flight_id: "16292-2209301715--32080-1-13554-2210010555|13554-2210301025--32080-1-16292-2210311020"
    }

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
