require './lib/atm.rb'

describe Atm do
	let(:account) {double(:account, pin: 1234, balance: 100, expiry_date: '12/16', status: :active)}

  it 'allow withdraw if card status is active.' do

  end

  it 'reject if card status is cancelled.' do
    allow(account).to receive(:status).and_return(:cancelled)
  end

  it 'has 1000$ on initializing.' do
    expect(subject.balance).to eq 1000
  end
  
  it 'balance is reduced at withdraw' do
    subject.withdraw(5, 1234, account)
    expect(subject.balance).to eq 995
  end

  it 'reject withdraw if card is expired' do
  	#account.expiry_date = '12/15'
    allow(account).to receive(:expiry_date).and_return('12/15')
    expected_output = { status: false, message: 'card expired', date: Date.today}
  	expect(subject.withdraw(10, 1234, account)).to eq expected_output
  end

  it 'reject withdraw if account balance is too low' do
  	expected_output = { status: false, message: 'not sufficient funds in account', date: Date.today}
   		expect(subject.withdraw(150, 1234, account)).to eq expected_output
  end

	xit 'expect withdraw of 15 to output bills array' do
		expect(subject.add_bills(15)).to eq({status: true, bills: [10, 5]})
	end

	it 'reject if amount is not divisible by 5' do
		expected_output = { status: false, message: 'wrong amount', date: Date.today}
		expect(subject.withdraw(6, 1234, account)).to eq expected_output
	end

	it 'reject if pin is incorrect' do
		expected_output = { status: false, message: 'wrong pin', date: Date.today}
		expect(subject.withdraw(5, 1233, account)).to eq expected_output
	end

	it 'returns at successful withdraw' do
		expected_output = { status: true, message: 'success', date: Date.today, amount: 35, bills: [20,10,5]}
		expect(subject.withdraw(35, 1234, account)).to eq expected_output
	end
end
