# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create! user_name: "Admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", role: 1
User.create! user_name: "User", email: "test@gmail.com",
  password: "123456", password_confirmation: "123456", role: 0
5.times do |n|
  name  = Faker::Name.name
  Genre.create! name: name
end
Movie.create! name:"One Punch Man", content:"Hello World"
