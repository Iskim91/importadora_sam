# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Destroying all Clothes"

Clothe.destroy_all

puts "Creating Clothes"
file = URI.open("https://images.unsplash.com/photo-1564859228273-274232fdb516?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3456&q=80")
10.times do
  clothe = Clothe.create!(
    name: "Apple",
    description: "this apple is very good",
    category: "Shirt",
    gender: "Men",
    price: 20,
    size: "S",
    )
  clothe.photos.attach(io: File.open('app/assets/images/t-shirt.jpeg'), filename: 't-shirt.jpeg')
end

puts "#{Clothe.count} clothes have been created"
