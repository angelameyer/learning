require_relative 'player'

class ClumsyPlayer < Player 

	attr_reader :boost_factor

	def initialize(name, health=100, boost_factor=1)
		super(name, health)
		@boost_factor = boost_factor
	end

	def woot
		@boost_factor.times { super }
	end

	def found_treasure(treasure)
		points = treasure.points / 2.0
	 	@found_treasures[treasure.name] += treasure.points
	  puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
	end

end

if __FILE__ == $0
  clumsy = ClumsyPlayer.new("klutz")  
  
  hammer = Treasure.new(:hammer, 50)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  clumsy.found_treasure(hammer)
  
  crowbar = Treasure.new(:crowbar, 400)
  clumsy.found_treasure(crowbar)
  
  clumsy.each_found_treasure do |treasure|
    puts "#{treasure.points} total #{treasure.name} points"
  end
  puts "#{clumsy.points} grand total points"
end

