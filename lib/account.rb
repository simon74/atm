class Account
	attr_accessor :pin, :expiry_date, :balance, :owner, :account_status
  STANDARD_VALIDITY_YRS = 5

	def initialize(person, options = {})
		@pin = rand(1000..9999)
		@expiry_date = Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%Y')
		@balance = options[:balance] || 0
		@owner = person
    @account_status = :active
	end

def self.deactivate(account)
  account.account_status = :deactivated
end

end