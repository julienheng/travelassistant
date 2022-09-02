require 'uri'
require 'net/http'
require 'openssl'

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

    unless @flights
      flash[:alert] = 'Flight not found'
    end

    redirect_to new_trip_flight_path(1)
  end

  def dashboard
  end

  private

  def find_flight
    # url = URI("https://skyscanner50.p.rapidapi.com/api/v1/searchFlights?origin=SIN&destination=LHR&date=2022-09-30&returnDate=2022-10-30&adults=1&currency=USD&countryCode=US&market=en-US")

    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    # request = Net::HTTP::Get.new(url)
    # request["X-RapidAPI-Key"] = 'ac49dd4730msh08ae8f552f388afp1aadd1jsn9b400b1d9b91'
    # request["X-RapidAPI-Host"] = 'skyscanner50.p.rapidapi.com'

    # response = http.request(request)
    # response.read_body

    response = {
      flight1: [1, 2, 3]
    }
    response
  end

  def find_accomms
  end

  def find_restaurants
  end

  def find_attractions
  end
end
