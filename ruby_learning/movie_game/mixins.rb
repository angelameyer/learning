module Rankable
	def thumbs_up
		puts "#{@title} got a thumbs up!"
	end
end



	class Movie
		include Rankable
		def initialize(title, rank)
			@title = title
			@rank = rank
		end
	end

	class Song
		include Rankable
		def initialize(title, rank)
			@title = title
			@rank = rank
		end
	end

	