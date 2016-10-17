# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([{        email: "example@gmail.com",
                      role: 1, }])

Movie.create([{       name: "movie 1",
                      content: "mô tả phim 1",
                      user_id: 1 }])
Comment.create([{     content: "comment 1",
                      user_id: 1,
                      movie_id: 1 }])
Rate.create([{        rate: 4,
                      user_id: 1,
                      movie_id: 1 }])
Genre.create([{       name: "Kinh dị" }])
Actor.create([{       name: "Tom" }])
MovieActor.create([{  movie_id: 1,
                      actor_id: 1}])
MovieGenre.create([{  movie_id: 1,
                      genre_id: 1}])