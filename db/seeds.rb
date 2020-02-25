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
User.destroy_all
Session.destroy_all

require 'faker'

puts 'Creating 10 fake users'

10.times do
  User.create!(
   email: Faker::Internet.email,
   password:Faker::Internet.password
  )
end

puts 'Finished'

puts 'Creating 10 fake sessions'

10.times do
  Session.create!(
    movie: Faker::Name.name,
    description: Faker::Movies::VForVendetta.quote,
    neighborhood: Faker::Address.city,
    address: Faker::Address.full_address,
    date: Faker::Date.forward(days: 23),
    capacity: Faker::Number.number(digits: 2),
    price: Faker::Number.between(from: 1, to: 3),
    user_id: User.first.id
  )
end

puts 'Finished'
