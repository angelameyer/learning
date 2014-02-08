require_relative 'movie'
require_relative 'playlist'
require_relative 'movie3d'

movie1 = Movie.new("Goonies", 10)
movie2 = Movie.new("Ghostbusters", 9)
movie3 = Movie.new("Goldfinger")

playlist = Playlist.new("Kermit")
playlist.load(ARGV.shift || "movies.csv")



loop do
	puts "How many viewings? ('quit' to exit)"
	answer = gets.chomp.downcase
	case answer
	when /^\d+$/
		puts "playing the game"
	when 'quit', 'exit'
		puts "done"
		break
	else
		puts "Please enter a number or 'quit'"
	end
	puts "Enjoy your #{answer} viewings..."
end


