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


Flight.destroy_all
Accommodation.destroy_all

#Activity.destroy_all
#Restaurant.destroy_all
#Attraction.destroy_all

puts "Creating New Seeds"

puts "Creating users"

  user1 = User.create!(
    name: "Delvin",
    phone: "781646738",
    email: "delvin44@email.com",
    password: "password123"
  )

  puts "Creating trips"
  trip1 = Trip.create!(
    user: user1,
    start_date: 20220830,
    end_date: 20220912,
    location: "bangkok",
    budget: 5000,
    total_cost: 4000,
    latitude: 13.7563,
    longitude: 100.5018,
    currency: "SGD"
  )
  puts "trip id:#{trip1.id} created"

puts "Creating Companions"

  Companion.create!(
    name: "Julien",
    age: 30,
    category: "friends",
    trip: trip1
  )

# Flights, Hotels, Activities

puts "Creating flights! (2 API calls)"
Flight.create!(
  place_name: "London",
  iata_code: "LON",
  amount: 659.37,
  outbound_origin_display_code: "LGW",
  outbound_destination_display_code: "JFK",
  outbound_departure: "2022-08-31T12:50:00",
  outbound_arrival: "2022-08-31T15:45:00",
  outbound_carrier_name: "Norse Atlantic Airways",
  inbound_origin_display_code: "JFK",
  inbound_destination_display_code: "LGW",
  inbound_departure: "2022-09-09T18:25:00",
  inbound_arrival: "2022-09-10T06:45:00",
  inbound_carrier_name: "Norse Atlantic Airways",
  api_flight_id: "13542-2208311250--30667-0-12712-2208311545|12712-2209091825--30667-0-13542-2209100645",
  booked: true,
  selected: true,
  trip: trip1
)

puts "Creating accomodations!"
Accommodation.create!(
  entity_id: "27544008",
  hotel_id: "178868522",
  name: "Ramada by Wyndham London North M1",
  price: "$227",
  latitude: -0.263784,
  longitude: 51.629313,
  cheapest_partner: "Agoda",
  stars: 4,
  hero_image: "https://d2xf5gjipzd8cd.cloudfront.net/available/678584481/678584481_WxH.jpg",
  value: "8.0",
  description: "very good",
  booked: true,
  selected: true,
  trip: trip1
)

puts "Creating activities"

#puts "Creating attractions"
#attraction1 = Attraction.create!(
  #attraction: ,
  #name: ,
  #address: ,
  #category: ,
  #price: ,
  #rating: ,
#)

#puts "Creating restaurants (3 API calls)"
#restaurant1 = Restaurant.create!(
  #google_place_id: ,
  #id_city: ,
  #name: ,
  #street: ,
  #postalCode: ,
  #longitude: ,
  #latitude: ,
  #priceRange: ,
  #ratingValue: ,
  #currenciesAccepted: ,
#)

puts "Seeds created!"
