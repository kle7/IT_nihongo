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

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create! user_name: name, email: email, password: password,
    password_confirmation: password, role: 0
end
Genre.create! name:"Funny"
Genre.create! name:"Advanture"
Genre.create! name:"Fantasy"
Genre.create! name:"Action"
Genre.create! name:"Honor"

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence
  year = rand(1900...2016)
  actor = Faker::Name.name
  movie = Movie.create! name: name, content: content, year: year, actor: actor
  movie_id = movie.id
  genre_id = 1
  MovieGenre.create! movie_id: movie_id, genre_id: genre_id
end

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence
  year = rand(1990...2016)
  actor = Faker::Name.name
  movie = Movie.create! name: name, content: content, year: year, actor: actor
  movie_id = movie.id
  genre_id = 1
  MovieGenre.create! movie_id: movie_id, genre_id: genre_id
end

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence
  year = rand(1990...2016)
  actor = Faker::Name.name
  movie = Movie.create! name: name, content: content, year: year, actor: actor
  movie_id = movie.id
  genre_id = 2
  MovieGenre.create! movie_id: movie_id, genre_id: genre_id
end

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence
  year = rand(1990...2016)
  actor = Faker::Name.name
  movie = Movie.create! name: name, content: content, year: year, actor: actor
  movie_id = movie.id
  genre_id = 3
  MovieGenre.create! movie_id: movie_id, genre_id: genre_id
end

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence
  year = rand(1990...2016)
  actor = Faker::Name.name
  movie = Movie.create! name: name, content: content, year: year, actor: actor
  movie_id = movie.id
  genre_id = 4
  MovieGenre.create! movie_id: movie_id, genre_id: genre_id
end

10.times do |n|
  name  = Faker::Name.name
  content = Faker::Lorem.sentence
  year = rand(1990...2016)
  actor = Faker::Name.name
  movie = Movie.create! name: name, content: content, year: year, actor: actor
  movie_id = movie.id
  genre_id = 5
  MovieGenre.create! movie_id: movie_id, genre_id: genre_id
end

20.times do |n|
  user_id = rand(1...50)
  movie_id = rand(1...50)
  vote = rand(1...5)
  Rate.create! user_id: user_id, movie_id: movie_id, vote: vote
end

Movie.create! name:"One Punch Man", content:"Hello World", year: 2016, actor: "saitama"
