class Atm
	attr_accessor :balance

	def initialize
		@balance = 1000
	end

	def withdraw(amount)
		@balance = @balance - amount
	end
end