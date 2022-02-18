# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "json"
require "open-uri"

puts "creating movies ..."
url = "http://tmdb.lewagon.com/movie/top_rated"
movies = JSON.parse(URI.open(url).read)['results']
movies.first(20).each do |movie|
  url_poster = "https://image.tmdb.org/t/p/w500"
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "#{url_poster}#{movie["poster_path"]}",
    rating: movie["vote_average"]
    )
end

puts "movies created! ..."
