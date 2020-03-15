
require "json"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Destroying all Clothes"
Transaction.destroy_all

Clothe.destroy_all
puts "Creating Clothes"

2.times do
  clothe = Clothe.create!(
    name: "Apple",
    description: "this apple is very good",
    category: "T-Shirt",
    gender: "Men",
    price_cents: 950,
    sku: "mountain_shirt"
    )
  clothe.photos.attach(io: File.open('app/assets/images/t-shirt2.jpeg'), filename: 't-shirt.jpeg')
end
2.times do
  clothe = Clothe.create!(
    name: "Apple",
    description: "this apple is very good",
    category: "T-Shirt",
    gender: "Men",
    price_cents: 950,
    sku: "mountain_shirt"
    )
  clothe.photos.attach(io: File.open('app/assets/images/t-shirt.jpeg'), filename: 't-shirt.jpeg')
end

2.times do
  clothe = Clothe.create!(
    name: "Flower",
    description: "Floral dress is very pretty",
    category: "Dress",
    gender: "Women",
    price_cents: 2000,
    sku: "floral-dress"
    )
  clothe.photos.attach(io: File.open('app/assets/images/dress.jpeg'), filename: 'dress.jpeg')
end
2.times do
  clothe = Clothe.create!(
    name: "Comfy Jeans",
    description: "Nice fitted jeans for any season",
    category: "Pants",
    gender: "Women",
    price_cents: 2000,
    sku: "Pants_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/female jeans 2.jpeg'), filename: 'jeans.jpeg')
end

2.times do
  clothe = Clothe.create!(
    name: "Comfy Jeans",
    description: "Nice fitted jeans for any season",
    category: "Pants",
    gender: "Women",
    price_cents: 2000,
    sku: "Pants_2"
    )
  clothe.photos.attach(io: File.open('app/assets/images/female jeans 3.jpeg'), filename: 'jeans.jpeg')
end
2.times do
  clothe = Clothe.create!(
    name: "Sweater ",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Sweater_0"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesweater.jpeg'), filename: 'sweater.jpeg')
end

2.times do
  clothe = Clothe.create!(
    name: "Comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Sweater_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesweater2.jpeg'), filename: 'sweater.jpeg')
end
2.times do
  clothe = Clothe.create!(
    name: "Comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Sweater_2"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesweater3.jpeg'), filename: 'sweater.jpeg')
end
2.times do
  clothe = Clothe.create!(
    name: "Comfy suit",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Suit_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesuit.jpeg'), filename: 'suit.jpeg')
end
2.times do
  clothe = Clothe.create!(
    name: "Comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Women",
    price_cents: 2000,
    sku: "female_sweater_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/sweater.jpeg'), filename: 'sweater.jpeg')
end
2.times do
  clothe = Clothe.create!(
    name: "Comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Women",
    price_cents: 2000,
    sku: "female_sweater_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/sweater2.jpeg'), filename: 'sweater.jpeg')
end


puts "creating colors"


  hex = %w[0047AB 95F9E3 138A36 FF4B3E FF8552 054A29]
  i = 0
6.times do
  url = open("https://www.thecolorapi.com/id?hex=#{hex[i]}").read
  color_name = JSON.parse(url)["name"]["value"]
  color = Color.create(name: color_name, hex: hex[i] )
  i += 1
end




puts "#{Clothe.count} clothes have been created"
puts "#{Color.count} colors have been created"






























