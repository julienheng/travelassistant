# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Deleting Old Seeds"
User.destroy_all
Companion.destroy_all
Trip.destroy_all

#must we destroy the join tables?
Flight.destroy_all
Hotel.destroy_all

Activity.destroy_all
Restaurant.destroy_all
Attraction.destroy_all


puts "Creating New Seeds"

puts "Creating users"
user1 = User.create!(
  name: "Delvin",
  phone: "781646738",
  email: "delvin44@email.com",
  password: "password123",
)

puts "Creating trips"
trip1 = Trip.create!(
  user: user1,
  start_date:
  end_date:
  location:
  budget:
  total_cost:
  latitude:
  longitude:
  currency:
)

puts "Creating Companions"
Companion.create!(
  name:
  age:
  type:
  trip: trip1
)


# Flights, Hotels, Activities

puts "Creating flights! (2 API calls)"
Flight.create!(
  flight: ,
  PlaceName: ,
  IataCode: ,
  amount: ,
  outbound_origin_display_code: ,
  outbound_destination_display_code: ,
  outbound_departure: ,
  outbound_arrival: ,
  outbound_carrier_name: ,
  inbound_origin_display_code: ,
  inbound_destination_display_code: ,
  inbound_departure: ,
  inbound_arrival: ,
  inbound_carrier_name: ,
  api_flight_id: ,
)

puts "Creating hotels!"
Hotel.create!(
  hotel: ,
  entityID: ,
  hotelID: ,
  name: ,
  price: ,
  coordinates: ,
  cheapestOfferPartnerName: ,
  stars: ,
  heroImage: ,
  value: ,
  description: ,
)

puts "Creating activities"

puts "Creating attractions"
attraction1 = Attraction.create!(
  attraction: ,
  name: ,
  address: ,
  category: ,
  price: ,
  rating: ,
)

puts "Creating restaurants (3 API calls)"
restaurant1 = Restaurant.create!(
  google_place_id: ,
  id_city: ,
  name: ,
  street: ,
  postalCode: ,
  longitude: ,
  latitude: ,
  priceRange: ,
  ratingValue: ,
  currenciesAccepted: ,


)

puts "Seeds created!"
