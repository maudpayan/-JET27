# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Jet.destroy_all

users = []
5.times do
 users << User.create(email: 'maudichou56@hotmail.fr', password: '123456')
end

10.times do
  name = Faker::Name.name
  description = Faker::ChuckNorris.fact
  price_day = Faker::Number.digit
  pax = Faker::Number.digit
  address = Faker::Address.full_address
  new_jet = Jet.create!(user: users.sample, name: name, description: description, price_day: price_day, pax: pax, address: address)
end

