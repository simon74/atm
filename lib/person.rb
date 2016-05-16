require './lib/account'

class Person
	attr_accessor :name, :cash, :account

	def initialize(name, cash)
		@cash = 0
		@name = 'Simon'
		@account = nil
	end
end

