# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# #
# # Faker::Internet.email
# # Faker::Movies::Hobbit.quote
# # Faker::Address.mail_box
# # Faker::Address.city
# # Faker::Address.full_address
# # Faker::Date.forward(days: 23)
# require 'nokogiri'
# require 'faker'

# Session.destroy_all
# User.destroy_all

# puts 'Creating 10 fake users'

# 3.times do
#   User.create!(
#    email: Faker::Internet.email,
#    password: "123456",
#    first_name: Faker::Name.first_name,
#    last_name: Faker::Name.last_name,
#   )
# end

# puts 'Finished'

# <<<<<<< HEAD
# names = ['A Quiet Place Part II', 'Birds of Prey', 'Bad Boys for Life', 'The Lodge', 'Wonder Woman 1984']

# neighborhoods = ["Alvalade", "Bairro Alto", "Areeiro", "Intendente", "Olivais"]

# names.each do |name|
#   url = "http://www.omdbapi.com/?s=#{name}&apikey=adf1f2d7"
# =======
# puts 'Creaing movie info'

# movies = [
#   { title: 'A Quiet Place Part II', year: '2020'},
#   { title: 'Birds of Prey', year: '2020' },
#   { title: 'Mulan', year: '2020' },
#   { title: 'The Lodge', year: '2019' },
#   { title: 'Wonder Woman 1984', year: '2020' },
# ];

# neighborhoods = ["Alvalade", "Bairro Alto", "Areeiro", "Intendente", "Olivais"]

# movies.each do |movie|
#   url = "http://www.omdbapi.com/?t=#{movie[:title]}&y=#{movie[:year]}&apikey=adf1f2d7"
# >>>>>>> master
#   page = Nokogiri::HTML(open(url).read)
#   result = JSON.parse(page)
#   Session.create!(
# <<<<<<< HEAD
#     movie: name,
# =======
#     movie: movie[:title],
# >>>>>>> master
#     description: result["Plot"],
#     neighborhood: neighborhoods.sample,
#     address: Faker::Address.full_address,
#     date: Faker::Date.forward(days: 23),
#     capacity: Faker::Number.number(digits: 2),
#     price: Faker::Number.between(from: 0, to: 5),
#     user_id: User.first.id,
#     picture_url: result["Poster"]
#   )
# end

# <<<<<<< HEAD
# =======
# puts 'Finished'



# >>>>>>> master
# puts 'Creating sessions'

# puts 'Finished'

require 'nokogiri'
require 'faker'
Session.destroy_all
User.destroy_all
puts 'Creating 3 fake users'
3.times do
  User.create!(
   email: Faker::Internet.email,
   password: "123456",
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
  )
end
puts 'Finished'
puts 'Creaing movie info'
movies = [
  { title: 'A Quiet Place Part II', year: '2020'},
  { title: 'Birds of Prey', year: '2020' },
  { title: 'Mulan', year: '2020' },
  { title: 'The Lodge', year: '2019' },
  { title: 'Wonder Woman 1984', year: '2020' },
];
neighborhoods = ['Alvalade', 'Bairro Alto', 'Areeiro', 'Intendente', 'Olivais']
movies.each do |movie|
  url = "http://www.omdbapi.com/?t=#{movie[:title]}&y=#{movie[:year]}&apikey=adf1f2d7"
  page = Nokogiri::HTML(open(url).read)
  result = JSON.parse(page)
  Session.create!(
    movie: movie[:title],
    description: result['Plot'],
    neighborhood: neighborhoods.sample,
    address: Faker::Address.full_address,
    date: Faker::Date.forward(days: 23),
    capacity: Faker::Number.number(digits: 2),
    price: Faker::Number.between(from: 0, to: 5),
    user_id: User.first.id,
    picture_url: result['Poster']
  )
end
puts 'Finished'
puts 'Creating sessions'
puts 'Finished'


