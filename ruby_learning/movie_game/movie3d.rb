require_relative 'movie'

class Movie3D < Movie

	def initalize(title, rank, wow_factor)
		@wow_factor = wow_factor
	end

	def thumbs_up
		@wow_factor.times { super }
	end

	def show_effect
		puts "Wow!" * @wow_factor
	end
end
