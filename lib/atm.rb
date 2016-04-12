class Atm
  attr_accessor :balance 
  DEFAULT_BILLS = [20, 10, 5]

  def initialize
    @balance = 1000
  end

  def withdraw(amount)
    if amount % 5 == 0
      @balance = @balance - amount 
      { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount)}
    else
      false
    end
  end

def add_bills(amount)
  output = []
  DEFAULT_BILLS.each do |bill|
    while amount - bill >= 0
      amount = amount - bill 
      output << bill
    end
    output
  end
 end
end