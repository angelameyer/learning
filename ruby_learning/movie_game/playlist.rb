require_relative 'movie'
require_relative 'waldorf_and_statler'
require_relative 'snack_bar'

module Flicks

class Playlist
  attr_reader :name

  def initialize(name)
    @name = name
    @movies = []
  end

  def load(from_file)
    File.readlines(from_file).each do |line|
      add_movie(Movie.from_csv)
    end
  end

  def save(to_file="movie_rankings.csv")
    File.open("movie_rankings.csv", "w") do |file|
      movies.sort.each do |movie|
      file.puts movie.to_csv
    end
  end

  end
  def add_movie(a_movie)
    @movies << a_movie
  end

  def play(viewings)

    puts "#{@name}'s playlist:"
    puts @movies.sort
    snacks = SnackBar::SNACKS
    puts "\nThere are #{snacks.size} snacks available."

    puts @movies
    1.upto(viewings) do |count|
      puts "\n Viewing #{count}"
      @movies.each do |movie|
        WaldorfAndStatler.review(movie)
        snack = SnackBar.random
        movie.ate_snack(snack)
        puts movie
      end
    end
  end
end

def total_carbs_consumed
  @movies.reduce(0) do |sum, movie|
    sum + movie.carbs_consumed
  end
end

def print_stats
  puts "\n#{@name}'s Stats"

  @movies.sort.each do |movies|
    puts "\n#{movie.title}'s snack totals:"
    movie.each_snack do |snack|
      puts "#{snack.carbs} total #{snack.name} carbs"
    end
    puts "\n#{movie.carbs_consumed} grand total carbs"

  hits, flops = @movies.partition { |movie| movie.hit? }
  puts "\n Hits:"
  puts hits
  puts "\n Flops:"
  puts flops.sort
end
end

end