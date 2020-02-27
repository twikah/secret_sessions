# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Faker::Internet.email
# Faker::Movies::Hobbit.quote
# Faker::Address.mail_box
# Faker::Address.city
# Faker::Address.full_address
# Faker::Date.forward(days: 23)
require 'nokogiri'
require 'faker'

Session.destroy_all
User.destroy_all

puts 'Creating 10 fake users'

3.times do
  User.create!(
   email: Faker::Internet.email,
   password: "123456"
  )
end

puts 'Finished'


names = ['A Quiet Place Part II', 'Birds of Prey', 'Bad Boys for Life', 'The Lodge', 'Wonder Woman 1984']

neighborhoods = ["Alvalade", "Bairro Alto", "Areeiro", "Intendente", "Olivais"]


names.each do |name|
  url = "http://www.omdbapi.com/?s=#{name}&apikey=adf1f2d7"
  page = Nokogiri::HTML(open(url).read)
  json =  JSON.parse(page)
  p json
  result = json["Search"].first
  Session.create!(
    movie: name,
    description: Faker::Movies::VForVendetta.quote,
    neighborhood: neighborhoods.sample,
    address: Faker::Address.full_address,
    date: Faker::Date.forward(days: 23),
    capacity: Faker::Number.number(digits: 2),
    price: Faker::Number.between(from: 10, to: 30),
    user_id: User.first.id,
    picture_url: result["Poster"]
  )
end


puts 'Creating sessions'

puts 'Finished'
