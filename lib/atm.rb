class Atm
  attr_accessor :balance 
  DEFAULT_BILLS = [20, 10, 5]

  def initialize
    @balance = 1000
  end

def withdraw(amount, pin, account)
  case
  when pin_is_incorrect?(pin, account) then 
    return_message('wrong pin')
  when amount_not_divisible_by_five?(amount) then 
    return_message('wrong amount')
  else
    perform_transaction(amount, account)
  end
end

private
  def pin_is_incorrect?(pin, account)
    pin != account.pin
  end

  def amount_not_divisible_by_five?(amount)
    amount % 5 != 0
  end

  def return_message(message)
    { status: false, message: message, date: Date.today}    
  end

  def perform_transaction(amount, account)
      @balance = @balance - amount 
      { status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount)}
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