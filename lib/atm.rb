class Atm
	attr_accessor :balance

	def initialize
		@balance = 1000
	end

	def withdraw(amount)
		if amount % 5 == 0
			@balance = @balance - amount	
			# true
			return ({status: true, bills: [10, 5]})
		else
			false
		end
	end
end