
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

          # white  black orangy dress jeans  green-t b-dress bi-dr red-skirt snw b-swea multi-sweater              .
  hex = %w[FFFFFF 00000 EC0B2F 5B8078 79A3BD 637E7C DA9583 D3B9B2 D0CBCA  DABEA1 E3C0C8 F1F2F6 D2B5B7 F1DCE2 924B3C  005895 544B59 E1D5CE B46E58 0047AB 95F9E3 138A36 FF4B3E FF8552 054A29 B689FF 5C2751 6457A6 76E5FC 4BC0D9 2F92AF 2F568F 3174A0 3B5249 34252F]
  i = 0
hex.count.times do
  url = open("https://www.thecolorapi.com/id?hex=#{hex[i]}").read
  color_name = JSON.parse(url)["name"]["value"]
  color = Color.create(name: color_name, hex: hex[i] )
  i += 1
end


puts "Creating Clothes"
colors_ids = Color.all.map { |c| c.id }

unisex_sweater = Clothe.create!(
    name: "Comfy sweater",
    description: "Nice and soft sweated for the winter",
    category: "Sweater",
    gender: "Unisex",
    price_cents: 1299,
    sku: "unisex_sweater_1"
    )
unisex_sweater.photos.attach(io: File.open('app/assets/images/Female-sweater-1.1.jpeg'), filename: 'sweater.jpeg')
unisex_sweater.photos.attach(io: File.open('app/assets/images/Female-sweater-1.2.jpeg'), filename: 'sweater.jpeg')
unisex_sweater.photos.attach(io: File.open('app/assets/images/Female-sweater-1.3.jpeg'), filename: 'sweater.jpeg')
detail1 = Detail.create( clothe: unisex_sweater, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail1.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
unisex_sweater.colors << Color.find_by(hex: 'F1F2F6' )
unisex_sweater.colors << Color.find_by(hex: 'D2B5B7' )
unisex_sweater.colors << Color.find_by(hex: '924B3C' )
unisex_sweater.colors << Color.find_by(hex: '544B59' )


female_sweater_1 = Clothe.create!(
    name: "Elegant sweater",
    description: "Elegant, fashionable and thick sweater",
    category: "Sweater",
    gender: "Female",
    price_cents: 3000,
    sku: "female_sweater_1"
    )
female_sweater_1.photos.attach(io: File.open('app/assets/images/Female-sweater-2.1.jpeg'), filename: 'sweater.jpeg')
female_sweater_1.photos.attach(io: File.open('app/assets/images/Female-sweater-2.2.jpeg'), filename: 'sweater.jpeg')
female_sweater_1.photos.attach(io: File.open('app/assets/images/Female-sweater-2.3.jpeg'), filename: 'sweater.jpeg')
detail2 = Detail.create( clothe: female_sweater_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail2.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
female_sweater_1.colors << Color.find_by(hex: 'DABEA1' )


female_sweater_2 = Clothe.create!(
    name: "Oversized sweater",
    description: "Perfect spring sweater with a bit of shoulder showing",
    category: "Sweater",
    gender: "Female",
    price_cents: 2000,
    sku: "female_sweater_2"
    )
female_sweater_2.photos.attach(io: File.open('app/assets/images/Female-sweater-3.1.jpeg'), filename: 'sweater.jpeg')
female_sweater_2.photos.attach(io: File.open('app/assets/images/Female-sweater-3.2.jpeg'), filename: 'sweater.jpeg')
female_sweater_2.photos.attach(io: File.open('app/assets/images/Female-sweater-3.3.jpeg'), filename: 'sweater.jpeg')
female_sweater_2.photos.attach(io: File.open('app/assets/images/Female-sweater-3.4.jpeg'), filename: 'sweater.jpeg')
detail3 = Detail.create( clothe: female_sweater_2, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail3.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
female_sweater_2.colors << Color.find_by(hex: 'D0CBCA' )


male_sweater_1 = Clothe.create!(
    name: "Oversized male sweater",
    description: "Perfect spring sweater with a bit of shoulder showing",
    category: "Sweater",
    gender: "Male",
    price_cents: 1299,
    sku: "male_sweater_1"
    )
male_sweater_1.photos.attach(io: File.open('app/assets/images/male-sweater-1.1.jpeg'), filename: 'sweater.jpeg')
male_sweater_1.photos.attach(io: File.open('app/assets/images/male-sweater-1.2.jpeg'), filename: 'sweater.jpeg')
male_sweater_1.photos.attach(io: File.open('app/assets/images/male-sweater-1.3.jpeg'), filename: 'sweater.jpeg')
male_sweater_1.photos.attach(io: File.open('app/assets/images/male-sweater-1.4.jpeg'), filename: 'sweater.jpeg')
detail4 = Detail.create( clothe: male_sweater_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail4.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
male_sweater_1.colors << Color.find_by(hex: '544B59' )



male_sweater_2 = Clothe.create!(
    name: "North Western Hoodie",
    description: "Oversized hoodie",
    category: "Sweater",
    gender: "Male",
    price_cents: 1699,
    sku: "male_sweater_2"
    )
male_sweater_2.photos.attach(io: File.open('app/assets/images/male-sweater-2.1.jpeg'), filename: 'sweater.jpeg')
male_sweater_2.photos.attach(io: File.open('app/assets/images/male-sweater-2.2.jpeg'), filename: 'sweater.jpeg')
male_sweater_2.photos.attach(io: File.open('app/assets/images/male-sweater-2.3.jpeg'), filename: 'sweater.jpeg')
male_sweater_2.photos.attach(io: File.open('app/assets/images/male-sweater-2.4.jpeg'), filename: 'sweater.jpeg')
detail5 = Detail.create( clothe: male_sweater_2, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail5.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
male_sweater_2.colors << Color.find_by(hex: '000000' )
male_sweater_2.colors << Color.find_by(hex: 'FFFFFF' )


male_sweater_3 = Clothe.create!(
    name: "North Western Hoodie",
    description: "Oversized hoodie",
    category: "Sweater",
    gender: "Male",
    price_cents: 1500,
    sku: "male_sweater_3"
    )
male_sweater_3.photos.attach(io: File.open('app/assets/images/male-sweater-3.1.jpeg'), filename: 'sweater.jpeg')
male_sweater_3.photos.attach(io: File.open('app/assets/images/male-sweater-3.2.jpeg'), filename: 'sweater.jpeg')
male_sweater_3.photos.attach(io: File.open('app/assets/images/male-sweater-3.3.jpeg'), filename: 'sweater.jpeg')
male_sweater_3.photos.attach(io: File.open('app/assets/images/male-sweater-3.4.jpeg'), filename: 'sweater.jpeg')
detail6 = Detail.create( clothe: male_sweater_3, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail6.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
male_sweater_3.colors << Color.find_by(hex: '#F1DCE2' )


  jean_1 = Clothe.create!(
    name: "Skinny Jeans",
    description: "Nice fitted jeans for any season",
    category: "Pants",
    gender: "Women",
    price_cents: 1300,
    sku: "jean_1"
    )
  jean_1.photos.attach(io: File.open('app/assets/images/jeans-1.1.jpeg'), filename: 'jeans.jpeg')
  jean_1.photos.attach(io: File.open('app/assets/images/jeans-1.2.jpeg'), filename: 'jeans.jpeg')
  jean_1.photos.attach(io: File.open('app/assets/images/jeans-1.3.jpeg'), filename: 'jeans.jpeg')
  jean_1.photos.attach(io: File.open('app/assets/images/jeans-1.4.jpeg'), filename: 'jeans.jpeg')
  jean_1.photos.attach(io: File.open('app/assets/images/jeans-1.5.jpeg'), filename: 'jeans.jpeg')

  detail7 = Detail.create( clothe: jean_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail7.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')

  jean_1.colors << Color.find_by(hex: '79A3BD' )

  jean_2 = Clothe.create!(
    name: "Textured Jeans",
    description: "Comfortable jeans with texture on the knees",
    category: "Pants",
    gender: "Women",
    price_cents: 1000,
    sku: "jean_2"
    )
  jean_2.photos.attach(io: File.open('app/assets/images/jeans-2.1.jpeg'), filename: 'jeans.jpeg')
  jean_2.photos.attach(io: File.open('app/assets/images/jeans-2.2.jpeg'), filename: 'jeans.jpeg')
  jean_2.photos.attach(io: File.open('app/assets/images/jeans-2.3.jpeg'), filename: 'jeans.jpeg')
  jean_2.photos.attach(io: File.open('app/assets/images/jeans-2.4.jpeg'), filename: 'jeans.jpeg')
  jean_2.photos.attach(io: File.open('app/assets/images/jeans-2.5.jpeg'), filename: 'jeans.jpeg')
  jean_2.photos.attach(io: File.open('app/assets/images/jeans-2.6.jpeg'), filename: 'jeans.jpeg')

  detail8 = Detail.create( clothe: jean_2, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail8.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')

  jean_2.colors << Color.find_by(hex: '79A3BD' )



male_coat_1 = Clothe.create!(
    name: "Textured Jeans",
    description: "Comfortable jeans with texture on the knees",
    category: "Outer",
    gender: "Men",
    price_cents: 4000,
    sku: "male_coat_1"
    )
  male_coat_1.photos.attach(io: File.open('app/assets/images/male-coat-1.1.jpeg'), filename: 'male-coat.jpeg')
  male_coat_1.photos.attach(io: File.open('app/assets/images/male-coat-1.2.jpeg'), filename: 'male-coat.jpeg')
  male_coat_1.photos.attach(io: File.open('app/assets/images/male-coat-1.3.jpeg'), filename: 'male-coat.jpeg')

  detail9 = Detail.create( clothe: male_coat_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail9.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')

  male_coat_1.colors << Color.find_by(hex: '544B59' )


  male_shirt_1 = Clothe.create!(
    name: "Fashionable shirt with patterns",
    description: "Shirt with patterns, comfortable and warm",
    category: "Shirt",
    gender: "Men",
    price_cents: 900,
    sku: "male_shirt_1"
    )
  male_shirt_1.photos.attach(io: File.open('app/assets/images/male-shirt-1.1.jpeg'), filename: 't-shirt.jpeg')
  male_shirt_1.photos.attach(io: File.open('app/assets/images/male-shirt-1.2.jpeg'), filename: 't-shirt.jpeg')

  detail10 = Detail.create( clothe: male_shirt_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail10.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
  male_shirt_1.colors << Color.find_by(hex: '005895' )


male_tshirt_1 = Clothe.create!(
  name: "Skull shirt",
  description: "Cool skull shirt",
  category: "T-Shirt",
  gender: "Men",
  price_cents: 950,
  sku: "male_tshirt_1"
  )
male_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.1.jpeg'), filename: 't-shirt.jpeg')
male_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.2.jpeg'), filename: 't-shirt.jpeg')
male_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.4.jpeg'), filename: 't-shirt.jpeg')
male_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.3.jpeg'), filename: 't-shirt.jpeg')

detail11 = Detail.create( clothe: male_tshirt_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail11.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
male_tshirt_1.colors << Color.find_by(hex: '000000' )

  male_tshirt_2 = Clothe.create!(
    name: "Simple and bright shirt",
    description: "Refreshing color to wear for the summer",
    category: "T-Shirt",
    gender: "Men",
    price_cents: 1200,
    sku: "male_tshirt_2"
    )
  male_tshirt_2.photos.attach(io: File.open('app/assets/images/t-shirt-4.1.jpeg'), filename: 't-shirt.jpeg')
  male_tshirt_2.photos.attach(io: File.open('app/assets/images/t-shirt-4.2.jpeg'), filename: 't-shirt.jpeg')
  male_tshirt_2.photos.attach(io: File.open('app/assets/images/t-shirt-4.4.jpeg'), filename: 't-shirt.jpeg')
  male_tshirt_2.photos.attach(io: File.open('app/assets/images/t-shirt-4.3.jpeg'), filename: 't-shirt.jpeg')

  detail12 = Detail.create( clothe: male_tshirt_2, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail12.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
  male_tshirt_2.colors << Color.find_by(hex: '637E7C' )

male_tshirt_3 = Clothe.create!(
    name: "Simple shirt",
    description: "Refreshing color to wear for the summer",
    category: "T-Shirt",
    gender: "Men",
    price_cents: 900,
    sku: "male_tshirt_3"
    )
  male_tshirt_3.photos.attach(io: File.open('app/assets/images/t-shirt-1.1.jpeg'), filename: 't-shirt.jpeg')
  male_tshirt_3.photos.attach(io: File.open('app/assets/images/t-shirt-1.2.jpeg'), filename: 't-shirt.jpeg')

  detail13 = Detail.create( clothe: male_tshirt_3, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail13.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
  male_tshirt_3.colors << Color.find_by(hex: '000000' )
  male_tshirt_3.colors << Color.find_by(hex: 'FFFFFF' )


female_tshirt_1 = Clothe.create!(
  name: "Skull shirt",
  description: "Cool skull shirt",
  category: "T-Shirt",
  gender: "Men",
  price_cents: 950,
  sku: "female_tshirt_1"
  )
female_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.5.jpeg'), filename: 't-shirt.jpeg')
female_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.6.jpeg'), filename: 't-shirt.jpeg')
female_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.7.jpeg'), filename: 't-shirt.jpeg')
female_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.8.jpeg'), filename: 't-shirt.jpeg')
female_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-2.9.jpeg'), filename: 't-shirt.jpeg')

detail14 = Detail.create( clothe: female_tshirt_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
detail14.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
female_tshirt_1.colors << Color.find_by(hex: '000000' )

  unisex_tshirt_1 = Clothe.create!(
    name: "Force Majeure T-shirt",
    description: "Simple and refreshing t-shirt",
    category: "T-Shirt",
    gender: "Unisex",
    price_cents: 990,
    sku: "unisex_tshirt_1"
    )
  unisex_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-3.1.jpeg'), filename: 't-shirt.jpeg')
  unisex_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-3.2.jpeg'), filename: 't-shirt.jpeg')
  unisex_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-3.3.jpeg'), filename: 't-shirt.jpeg')
  unisex_tshirt_1.photos.attach(io: File.open('app/assets/images/t-shirt-3.4.jpeg'), filename: 't-shirt.jpeg')

  detail15 = Detail.create( clothe: unisex_tshirt_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail15.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
  unisex_tshirt_1.colors << Color.find_by(hex: '000000' )
  unisex_tshirt_1.colors << Color.find_by(hex: 'FFFFFF' )



  dress_1 = Clothe.create!(
    name: "Flower Dress",
    description: "Playful floral dress",
    category: "Dress",
    gender: "Women",
    price_cents: 2000,
    sku: "dress_1"
    )
  dress_1.photos.attach(io: File.open('app/assets/images/dress-1.1.jpeg'), filename: 't-shirt.jpeg')
  dress_1.photos.attach(io: File.open('app/assets/images/dress-1.2.jpeg'), filename: 't-shirt.jpeg')
  dress_1.photos.attach(io: File.open('app/assets/images/dress-1.3.jpeg'), filename: 't-shirt.jpeg')

  detail16 = Detail.create( clothe: dress_1, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail16.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
  dress_1.colors << Color.find_by(hex: 'EC0B2F' )

  dress_2 = Clothe.create!(
    name: "Pink and flowy Dress",
    description: "Dress with ruffles and flowy to create this elegant look",
    category: "Dress",
    gender: "Women",
    price_cents: 2500,
    sku: "dress_2"
    )
  dress_2.photos.attach(io: File.open('app/assets/images/dress-3.1.jpeg'), filename: 't-shirt.jpeg')
  dress_2.photos.attach(io: File.open('app/assets/images/dress-3.2.jpeg'), filename: 't-shirt.jpeg')

  detail17 = Detail.create( clothe: dress_2, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail17.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
  dress_2.colors << Color.find_by(hex: 'DA9583' )

  dress_3 = Clothe.create!(
    name: "Tool Dress",
    description: "Dress tool and bird embroidery",
    category: "Dress",
    gender: "Women",
    price_cents: 3000,
    sku: "dress_3"
    )
  dress_3.photos.attach(io: File.open('app/assets/images/dress-4.1.jpeg'), filename: 't-shirt.jpeg')
  dress_3.photos.attach(io: File.open('app/assets/images/dress-4.2.jpeg'), filename: 't-shirt.jpeg')

  detail18 = Detail.create( clothe: dress_3, information: "Nice outfit in different colors.\r\n\r\nIt is 100% cotton.\r\n\r\nThe materials in this piece are from the best quality\r\n\r\nIt is extremely comfortable and breathable\r\n\r\nThe elasticity will provide full range of movement\r\n")
  detail18.photo.attach(io: File.open('app/assets/images/cotton.jpeg'), filename: 'cotton.jpeg')
  dress_3.colors << Color.find_by(hex: 'D3B9B2' )

puts "#{Clothe.count} clothes have been created"
puts "#{Color.count} colors have been created"






























