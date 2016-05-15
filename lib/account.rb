class Account
	attr_accessor :pin, :expiry_date, :balance, :owner
	STANDARD_VALIDITY_YRS = 5

	def initialize(person, options = {})
		@pin = rand(1000..9999)
		# @expiry_date = Date.today.next_year.strftime("%m/%y")
		@expiry_date = Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%Y')
		@balance = options[:balance] || 0
		@owner = person
	end
end