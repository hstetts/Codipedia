# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: Time.now
  )

end

users = User.all


standard = User.create!(
  email: 'standard@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'standard'
)


premium = User.create!(
  email: 'premium@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'premium'
)


admin = User.create!(
  email: 'admin@example.com',
  password: 'password',
  confirmed_at: Time.now,
  role: 'admin'
)


#Create Wikis
users.each do |user|
  user.wikis.create!(
    user: users.sample,
    title: Faker::Superhero.name,
    body: Faker::Superhero.power,
    private: false
  )
end

wikis = Wiki.all


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
