require 'uri'
require 'net/http'
require 'openssl'

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def new
    if current_page?(new_trip_path)
      render 'trips/new_second'
    end
  end

  def generate
    # call iata code for origin and destination from location param in trip
    # pass iata code into api
    flights = find_flight

    unless flights
      flash[:alert] = 'Flight not found'
    end
    @flight = flights
  end

  private

  def find_flight
    url = URI("https://skyscanner50.p.rapidapi.com/api/v1/searchFlights?origin=LOND&destination=NYCA&date=2022-09-02&returnDate=2022-09-03&adults=1&currency=USD&countryCode=US&market=en-US")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    #request["X-RapidAPI-Key"] = '5d557e89cdmsh84e479760f4b0abp11837bjsn6b6ad46b3890'
    request["X-RapidAPI-Host"] = 'skyscanner50.p.rapidapi.com'

    response = http.request(request)
    puts response.read_body
  end
end
