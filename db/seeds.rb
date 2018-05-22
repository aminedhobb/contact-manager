# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contact.destroy_all

puts "creating contacts..."
100.times do
  Contact.create!(
    name: Faker::DragonBall.character,
    address: Faker::Address.street_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone
    )
end

puts "contacts created !"
