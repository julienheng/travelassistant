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
Restaurant.destroy_all
Attraction.destroy_all
Chat.destroy_all

puts "Creating New Seeds"

puts "Creating users"

1.times do |index|
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
    name: "Hilton London Tower Bridge Hotel",
    price: "$553",
    latitude: -0.263784,
    longitude: 51.629313,
    address: "5 More London Riverside, Tooley St, London SE1 2BY, UK",
    format_count: "1,406",
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
    name: "Tower Suites by Blue Orchid",
    price: "$523",
    latitude: -0.20238,
    longitude: 51.50265,
    address: "100 Minories, London EC3N 1JY, United Kingdom",
    format_count: "1,368",
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
    name: "Leonardo Royal Hotel",
    price: "$466",
    latitude: -0.18949,
    longitude: 51.4903,
    address: "8-14 Cooper's Row, London EC3N 2BQ, United Kingdom",
    format_count: "623",
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
    name: "Buckingham Palace Tour",
    address: "London SW1A 1AA, UK",
    category_name: "Sights & Landmarks",
    price: "$72.50",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )


  puts "Creating attraction 2 "
  attraction2 = Attraction.create!(
    name: "Harry Potter Studio Tour",
    address: "Studio Tour Drive WD25 7LR Watford, UK",
    category_name: "Exhibitions",
    price: "$109.98",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )

  puts "Creating attraction 3"
  attraction3 = Attraction.create!(
    name: "Westminster Abbey",
    address: "20 Deans Yd, London SW1P 3PA, UK",
    category_name: "Sights & Landmarks",
    price: "$69.90",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )

  puts "Creating attraction 4"
  attraction3 = Attraction.create!(
    name: "Up at The O2 ",
    address: "Peninsula Square, London SE10 0DX",
    category_name: "Adventure",
    price: "$82.50",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )

  puts "Creating attraction 5"
  attraction3 = Attraction.create!(
    name: "London Eye",
    address: "Riverside Building, County Hall, London SE1 7PB, United Kingdom",
    category_name: "Sights & Landmarks",
    price: "$25.50",
    rating: "4.5",
    booked: true,
    selected: true,
    trip: trip1
  )

  puts "Creating attraction 6"
  attraction3 = Attraction.create!(
    name: "St Paul's Cathedral",
    address: "St. Paul's Churchyard, London EC4M 8AD, United Kingdom",
    category_name: "Sights & Landmarks",
    price: "$14.50",
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
    name: "London Shell Co. Aboard The Prince Regent",
    street: "Sheldon Square Regent's Canal, London W2 6EP England",
    postal_code: "20129",
    longtitude: "9.2075285",
    latitude: "45.4658273",
    serves_cuisine: "British",
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
    name: "Blacklock Shoreditch",
    street: "28-30 Rivington Street, London EC2A 3DZ England",
    postal_code: "20121",
    longtitude: "9.18867",
    latitude: "45.4796256",
    serves_cuisine: "Steakhouse",
    price_range: "180",
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
    name: "Gordon Ramsay Street Pizza",
    street: "10 Bread Street, London EC4M 9AJ England",
    postal_code: "20121",
    longtitude: "9.1877565",
    latitude: "45.4940647",
    serves_cuisine: "Italian",
    price_range: "105",
    rating_value: 4.5,
    currencies_accepted: "EUR",
    main_photo_src: "https://res.cloudinary.com/tf-lab/image/upload/restaurant/287bd4ba-3ef9-43f7-89fc-87f5234c6ee2/49f4b418-535a-4c7a-811e-b209619196b5.jpg",
    booked: true,
    selected: true,
    trip: trip1
    )

  puts "Creating restaurant 4"
  restaurant3 = Restaurant.create!(
    google_place_id: "ChIJ53USP0nBhkcRjQ50xhPN_zw",
    city_id: 348_156,
    name: "Cafe in the Crypt",
    street: "Trafalgar Square, London WC2N 4JJ England",
    postal_code: "20121",
    longtitude: "9.1877565",
    latitude: "45.4940647",
    serves_cuisine: "Cafe",
    price_range: "20",
    rating_value: 4.5,
    currencies_accepted: "EUR",
    main_photo_src: "https://res.cloudinary.com/tf-lab/image/upload/restaurant/287bd4ba-3ef9-43f7-89fc-87f5234c6ee2/49f4b418-535a-4c7a-811e-b209619196b5.jpg",
    booked: true,
    selected: true,
    trip: trip1
    )

  puts "Creating restaurant 5"
  restaurant3 = Restaurant.create!(
    google_place_id: "ChIJ53USP0nBhkcRjQ50xhPN_zw",
    city_id: 348_156,
    name: "The Rising Sun",
    street: "137 Marsh Lane, London NW7 4EY England",
    postal_code: "20121",
    longtitude: "9.1877565",
    latitude: "45.4940647",
    serves_cuisine: "Italian Fusion",
    price_range: "89.90",
    rating_value: 4.5,
    currencies_accepted: "EUR",
    main_photo_src: "https://res.cloudinary.com/tf-lab/image/upload/restaurant/287bd4ba-3ef9-43f7-89fc-87f5234c6ee2/49f4b418-535a-4c7a-811e-b209619196b5.jpg",
    booked: true,
    selected: true,
    trip: trip1
    )

  puts "Creating restaurant 6"
  restaurant3 = Restaurant.create!(
    google_place_id: "ChIJ53USP0nBhkcRjQ50xhPN_zw",
    city_id: 348_156,
    name: "Alexander The Great",
    street: "8 Plender Street Bayham Street, London NW1 0JT England",
    postal_code: "20121",
    longtitude: "9.1877565",
    latitude: "45.4940647",
    serves_cuisine: "Mediterranean",
    price_range: "75",
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
  name: "Singapore",
  location: "singapore"
)

Chat.create!(
  name: "London",
  location: "london"
)

Chat.create!(
  name: "Bangkok",
  location: "bangkok"
)

Chat.create!(
  name: "Bali",
  location: "indonesia"
)

Chat.create!(
  name: "Copenhagen",
  location: "denmark"
)

Chat.create!(
  name: "Shanghai",
  location: "china"
)

Chat.create!(
  name: "Madrid",
  location: "Spain"
)

Chat.create!(
  name: "New York",
  location: "usa"
)

Chat.create!(
  name: "Lima",
  location: "peru"
)

Chat.create!(
  name: "Dubai",
  location: "uae"
)

# --------------------------admin user -----------------------------#

puts "Creating admin user"

User.create!(
  name: "admin1",
  phone: "12345",
  email: "admin@email.com",
  password: "password123",
  role: "admin"
)

puts "Seeds created!"
