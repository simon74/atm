require './lib/account'

class Person
  attr_accessor :name, :cash, :account

  def initialize(options = {})
    @cash = options[:cash]
    @name = check_for_name(options)
    @account = nil
  end

  private

  def check_for_name(options)
    options[:name] ? options[:name] : raise('A name is required')
  end
end
