require_relative('../db/sql_runner.rb')
require_relative('../star.rb')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :rating, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating'].to_i
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO movies (title,genre,rating)
          VALUES ($1,$2,$3)
          RETURNING id"
    values = [@title,@genre,@rating]
    movie = SqlRunner.run(sql, values).first()
    @id = movie['id'].to_i
  end

  def update
    sql = "UPDATE movies SET (title, genre, rating) =
    ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @rating, @id]
    SqlRunner.run(sql, values)
  end

  def stars()
    sql = "SELECT stars.* FROM stars INNER JOIN castings ON castings.star_id =
    stars.id WHERE castings.movie_id = $1"
    values = [@id]
    star_hashes = SqlRunner.run(sql, values)
    return Star.map_items(star_hashes)
  end

  def pay_star(star_fee)
    @budget -= star_fee
    sql = "UPDATE movies SET budget = $1 WHERE id = $2"
    values = [@budget, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movie_hashes = SqlRunner.run(sql)
    return self.map_items(movie_hashes)
  end

  def self.map_items(movie_hashes)
    result = movie_hashes.map{|movie_hash| self.new(movie_hash)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

end
