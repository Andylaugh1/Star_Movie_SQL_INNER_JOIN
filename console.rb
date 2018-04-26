require('pry')
require_relative('models/casting.rb')
require_relative('models/movie.rb')
require_relative('models/star.rb')

Star.delete_all()
Movie.delete_all()
Casting.delete_all()


star1 =Star.new({
  "first_name" => "Brad",
  "last_name" => "Pitt",
  "fee" => 10
  })
star1.save()

star2 =Star.new({
  "first_name" => "Reese",
  "last_name" => "Witherspoon",
  "fee" => 20
  })
star2.save()

star3 =Star.new({
  "first_name" => "Mcauley",
  "last_name" => "Caulkin",
  "fee" => 30
  })
star3.save()

movie1 = Movie.new({
  "title" => 'Seven',
  "genre" => 'Detective',
  "rating" => 4,
  "budget" => 30
  })
movie1.save()

movie2 = Movie.new({
  "title" => 'Cruel Intentions',
  "genre" => 'Drama',
  "rating" => 3,
  "budget" => 40
  })
movie2.save()

movie3 = Movie.new({
  "title" => 'Home Alone',
  "genre" => 'Comedy',
  "rating" => 4,
  "budget" => 50
  })
movie3.save()

casting1 =Casting.new ({
  "movie_id"=> movie1.id,
  "star_id"=> star1.id
  })
casting1.save()

casting2 =Casting.new ({
  "movie_id"=> movie2.id,
  "star_id"=> star2.id
  })
casting2.save()

casting3 =Casting.new ({
  "movie_id"=> movie3.id,
  "star_id"=> star3.id
  })
casting3.save()

binding.pry
nil
