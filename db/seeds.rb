
require "json"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"
puts "Destroying all Transactions"

Transaction.destroy_all

puts "Destroying all Clothes"
Clothe.destroy_all

puts "Destroying all Colors"
Color.destroy_all



puts "creating colors"


  hex = %w[5B8078 E1D5CE B46E58 0047AB 95F9E3 138A36 FF4B3E FF8552 054A29 B689FF 5C2751 6457A6 76E5FC 4BC0D9 2F92AF 2F568F 3174A0 3B5249 34252F]
  i = 0
hex.count.times do
  url = open("https://www.thecolorapi.com/id?hex=#{hex[i]}").read
  color_name = JSON.parse(url)["name"]["value"]
  color = Color.create(name: color_name, hex: hex[i] )
  i += 1
end


puts "Creating Clothes"
colors_ids = Color.all.map { |c| c.id }
1.times do
  clothe = Clothe.create!(
    name: "Comfy T-shirt",
    description: "Light and strechable t-shirt",
    category: "T-Shirt",
    gender: "Men",
    price_cents: 950,
    sku: "t-shirt"
    )
  clothe.photos.attach(io: File.open('app/assets/images/t-shirt2.jpeg'), filename: 't-shirt.jpeg')
  clothe.photos.attach(io: File.open('app/assets/images/shirt.jpeg'), filename: 't-shirt.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end
1.times do
  clothe = Clothe.create!(
    name: "Simple and comfortable T-shirt",
    description: "Plain color made out of a breathable material",
    category: "T-Shirt",
    gender: "Men",
    price_cents: 950,
    sku: "mountain_shirt"
    )
  clothe.photos.attach(io: File.open('app/assets/images/shirt.jpeg'), filename: 't-shirt.jpeg')
  clothe.photos.attach(io: File.open('app/assets/images/t-shirt.jpeg'), filename: 't-shirt.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Flower Dress",
    description: "Playful floral dress",
    category: "Dress",
    gender: "Women",
    price_cents: 2000,
    sku: "floral-dress"
    )
  clothe.photos.attach(io: File.open('app/assets/images/dress.jpeg'), filename: 'dress.jpeg')
  clothe.photos.attach(io: File.open('app/assets/images/dress2.jpeg'), filename: 'dress.jpeg')
  clothe.photos.attach(io: File.open('app/assets/images/dress3.jpeg'), filename: 'dress.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Comfy Jeans",
    description: "Nice fitted jeans for any season",
    category: "Pants",
    gender: "Women",
    price_cents: 2000,
    sku: "Pants_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/female jeans 2.jpeg'), filename: 'jeans.jpeg')
  clothe.photos.attach(io: File.open('app/assets/images/female jeans 4.jpeg'), filename: 'jeans.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Textured Jeans",
    description: "Nice fitted jeans for any season",
    category: "Pants",
    gender: "Women",
    price_cents: 2000,
    sku: "Pants_2"
    )
  clothe.photos.attach(io: File.open('app/assets/images/female jeans 3.jpeg'), filename: 'jeans.jpeg')
  clothe.photos.attach(io: File.open('app/assets/images/female jeans 5.jpeg'), filename: 'jeans.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Warm and comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Sweater_0"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesweater.jpeg'), filename: 'sweater.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Stylish sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Sweater_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesweater2.jpeg'), filename: 'sweater.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Oversized sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Sweater_2"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesweater3.jpeg'), filename: 'sweater.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Comfy and cozy suit",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Men",
    price_cents: 2000,
    sku: "Suit_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/malesuit.jpeg'), filename: 'suit.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Women",
    price_cents: 2000,
    sku: "female_sweater_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/sweater.jpeg'), filename: 'sweater.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end

1.times do
  clothe = Clothe.create!(
    name: "Comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Women",
    price_cents: 2000,
    sku: "female_sweater_1"
    )
  clothe.photos.attach(io: File.open('app/assets/images/sweater2.jpeg'), filename: 'sweater.jpeg')
  rand(3..6).times do
    clothe.colors << Color.find(colors_ids.sample)
  end
  detail = Detail.create( clothe: clothe, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
end



puts "#{Clothe.count} clothes have been created"
puts "#{Color.count} colors have been created"






























