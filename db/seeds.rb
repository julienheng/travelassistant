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

# Activity.destroy_all
# Restaurant.destroy_all
Attraction.destroy_all

puts "Creating New Seeds"

puts "Creating users"

3.times do |index|
  user1 = User.create!(
    name: Faker::Name.unique.name,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    email: "email#{index}@email.com",
    password: "password123"
  )

  puts "Creating trips for #{user1.name}"

  #---------------------------trips--------------------------#
  trip1 = Trip.create!(
    user: user1,
    start_date: 202_208_30,
    end_date: 202_209_12,
    origin: "bangkok",
    destination: "singapore",
    budget: 5000,
    total_cost: 4000,
    latitude: 13.7563,
    longitude: 100.5018,
    currency: "SGD"
  )

  puts "trip id:#{trip1.id} created"

  #--------------------------companions------------------------#

  puts "Creating Companions for #{user1.name}"

  rand(1..3).times do
    Companion.create!(
      name: "Julien",
      age: 30,
      category: "friends",
      trip: trip1
    )
  end

  # ------------------  Flights -------------------- #

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

  # -------------------- accommodations ---------------------- #

  puts "Creating accomodation 1!"
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

  puts "Creating accomodation 2!"
  Accommodation.create!(
    entity_id: "27544008",
    hotel_id: "134634850",
    name: "Safestay London Kensington Holland Park",
    price: "$158",
    latitude: -0.20238,
    longitude: 51.50265,
    cheapest_partner: "Agoda",
    stars: 4,
    hero_image: "https://d2xf5gjipzd8cd.cloudfront.net/available/627028555/627028555_WxH.jpg",
    value: "8.0",
    description: "very good",
    booked: true,
    selected: true,
    trip: trip1
  )

  puts "Creating accomodation 3!"
  Accommodation.create!(
    entity_id: "27544008",
    hotel_id: "47079599",
    name: "YHA London Earl's Court",
    price: "$84",
    latitude: -0.18949,
    longitude: 51.4903,
    cheapest_partner: "Agoda",
    stars: 4,
    hero_image: "https://d2xf5gjipzd8cd.cloudfront.net/available/790137711/790137711_WxH.jpg",
    value: "8.0",
    description: "very good",
    booked: true,
    selected: true,
    trip: trip1
  )

  #-----------------------------attractions---------------------------------#

  puts "Creating attraction 1 "
  attraction1 = Attraction.create!(
    name: "Gardens by the Bay",
    address: "18 Marina Gardens Drive Bayfront Plaza, Singapore 018953 Singapore",
    category_name: "Sights & Landmarks",
    price: "$14.69",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )


  puts "Creating attraction 2 "
  attraction2 = Attraction.create!(
    name: "sentosa",
    address: "18 Marina Gardens Drive Bayfront Plaza, Singapore 018953 Singapore",
    category_name: "Sights & Landmarks",
    price: "$14.69",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )

  puts "Creating attraction 3"
  attraction3 = Attraction.create!(
    name: "Universal Studio Sigapore",
    address: "18 Marina Gardens Drive Bayfront Plaza, Singapore 018953 Singapore",
    category_name: "Sights & Landmarks",
    price: "$14.69",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )

  #------------------------------restaurants----------------------------------#

  puts "Creating restaurant 1"
  restaurant1 = Restaurant.create!(
    google_place_id: "ChIJ53USP0nBhkcRjQ50xhPN_zw",
    city_id: 348_156,
    name: "L'Alchimia",
    street: "Viale Premuda, 34",
    postal_code: "20129",
    longtitude: "9.2075285",
    latitude: "45.4658273",
    price_range: 75,
    rating_value: 4.5,
    currencies_accepted: "EUR",
    main_photo_src: "https://res.cloudinary.com/tf-lab/image/upload/restaurant/f5cdff1f-3cc7-4fba-b2ac-44c95ede85e4/b41c40e3-984e-4048-a197-5c3124b30c88.jpg",
    booked: true,
    selected: true,
    trip: trip1
    )


  puts "Creating restaurant 2"
  restaurant2 = Restaurant.create!(
    google_place_id: "ChIJ53USP0nBhkcRjQ50xhPN_zw",
    city_id: 348_156,
    name: "Misoya Milano",
    street: "Via Solferino, 41",
    postal_code: "20121",
    longtitude: "9.18867",
    latitude: "45.4796256",
    price_range: 25,
    rating_value: 4.5,
    currencies_accepted: "EUR",
    main_photo_src: "https://res.cloudinary.com/tf-lab/image/upload/restaurant/f5cdff1f-3cc7-4fba-b2ac-44c95ede85e4/b41c40e3-984e-4048-a197-5c3124b30c88.jpg",
    booked: true,
    selected: true,
    trip: trip1
    )


  puts "Creating restaurant 3"
  restaurant3 = Restaurant.create!(
    google_place_id: "ChIJ53USP0nBhkcRjQ50xhPN_zw",
    city_id: 348_156,
    name: "Light Sushi Restaurant",
    street: "Via Solferino, 41",
    postal_code: "20121",
    longtitude: "9.1877565",
    latitude: "45.4940647",
    price_range: 25,
    rating_value: 4.5,
    currencies_accepted: "EUR",
    main_photo_src: "https://res.cloudinary.com/tf-lab/image/upload/restaurant/287bd4ba-3ef9-43f7-89fc-87f5234c6ee2/49f4b418-535a-4c7a-811e-b209619196b5.jpg",
    booked: true,
    selected: true,
    trip: trip1
    )



end

# --------------------------chatrooms -----------------------------#

puts "Creating chatrooms"

Chat.create!(
  name: "general",
  location: "singapore"
)

Chat.create!(
  name: "random",
  location: "singapore"
)

Chat.create!(
  name: "memes",
  location: "singapore"
)

puts "Seeds created!"
