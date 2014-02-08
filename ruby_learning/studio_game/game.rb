 require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  
  attr_accessor :title
  
  def initialize(title)
    @title = title
    @players = []
  end

  def save_high_scores(filename="high_scores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title}High Scores:"
        puts "#{player.name.ljust(20, '.')} #{player.score}"
    end
  end

  def load_players(from_file)
    File.readlines(from_file).each do |line|
      name, health = line.split(',')
      player = Player.new(name, Integer(health))
      add_player(player)
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_stats 
    strong_players, wimpy_players = @players.partition { |player| player.strong?}

    @players.each do |player|
      puts "Statistics:\n"

      puts "\n #{strong_players.size} Strong Players:"
      strong_players.each do |player|
        print_name_and_health(player)
      end

      puts "\n #{wimpy_players.size} Wimpy Players:"
      wimpy_players.each do |player|
        print_name_and_health(player)
      end
    end
  
    @players.each do |player|
      puts "#{player.name} grand total points:"
      puts "\n #{player.points} grand total points"
    end

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points."
      end
      puts "#{player.points} grand total points"
    end
  end

  def sorted_players
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "\n #{formatted_name.name} #{player.score}"
    end
  end

  
  def add_player(a_player)
    @players.push(a_player)
  end

  def play(rounds)
    puts "\nThere are #{@players.size} players in #{@title}: "
    @players.each do |player|
      puts player
      treasures = TreasureTrove::TREASURES
      puts "\nThere are #{treasures.size} treasures to be found:"
      treasures.each do |treasure|
        puts "#{treasure.name} is worth #{treasure.point} points."
      end
    end

    1.upto(rounds) do |r|
      if block_given?
        break if yield
      end
      "\nRound#{r}:"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end
end
