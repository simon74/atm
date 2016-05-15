require './lib/account'

class Person
	attr_accessor :name, :cash, :account

	def initialize(name, cash)
		@cash = 0
		@name = 'Simon'
		@account = nil
	end

	def create_account
		@account == nil ? missing_account : deposit_funds(amount)
	end

	def withdraw(args = {})
		@account == nil ? missing_account : withdraw_funds(args)
	end

end