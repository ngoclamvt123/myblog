# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
(1..5).each do |i|
  user = User.create(name: Faker::Name.unique.name, email: "email#{i}@example.com", password: "123123")
  puts "User #{i} created"
  if user
    user.posts.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(5, true))
    puts "User #{i} create post"
  end
end
