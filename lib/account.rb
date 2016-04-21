class Account
		attr_accessor :pin, :expiry_date, :balance, :owner

		def initialize(person, options = {})
			@pin = rand(1000..9999)
			@expiry_date = Date.today.next_year.strftime("%m/%y")		
			@balance = options[:balance] || 0
			@owner = person
		end
end