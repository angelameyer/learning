class LoadedDie
	include Auditable
	attr_reader :number

	def roll
		numbers = [1, 1, 2, 5, 6, 6]
		@number = number.sample
		audit
		@number
	end
end