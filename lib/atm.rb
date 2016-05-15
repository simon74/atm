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

  when insufficient_funds_in_account?(amount, account) then
    return_message('not sufficient funds in account')

  when card_expired?(account) then
    return_message('card expired')

  when card_deactivated?(account) then
    return_message('card is deactivated')

  when amount_negativ?(amount) then
    return_message('no negative amounts')

  else
    perform_transaction(amount, account)
  end
end

private
  def amount_negativ?(amount)
    amount < 0
  end
  def card_deactivated?(account)
    account.account_status == :deactivated
  end

  def insufficient_funds_in_account?(amount, account)
    amount > account.balance
  end

  def card_expired?(account)
    Date.strptime(account.expiry_date, '%m/%y') < Date.today
  end

  def pin_is_incorrect?(pin, account)
    pin != account.pin
  end

  def amount_not_divisible_by_five?(amount)
    amount % 5 != 0
  end

  def return_message(message)
    {status: false, message: message, date: Date.today}
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
  end
  output
 end
end