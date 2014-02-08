require_relative 'player'
require_relative 'game'

player1 = Player.new("moe")
player2 = Player.new("larry", 60)
player3 = Player.new("curly", 125)

knuckleheads = Game.new("Knuckleheads")
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)
knuckleheads.print_stats
knuckleheads.load_players(ARGV.shift || "players.csv")

loop
	puts "\nHello, please enter how many rounds you would like to play. ('quit' to exit)"
	answer = gets.chomp.downcase
		case answer
		when /^\d+$/
		knuckleheads.play(answer)
		when "quit" || "exit"
		kunckleheads.print_stats
		break
		else 
		puts "Please enter a number or 'quit'."
	end
end

kunckleheads.save_high_scores
klutz = ClumsyPlayer.new("Klutz", 105)

knuckleheads.add_player(klutz)

berzerker = BerzerkPlayer.new("berzerker", 50)

knuckleheads.add_player(klutz)
knuckleheads.add_player(berzerk)