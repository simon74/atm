require './lib/atm.rb'

describe Atm do
	let(:account) {double(:account, pin: 1234)}

	it 'has 1000$ on initializing.' do
		expect(subject.balance).to eq 1000
	end
  
	it 'balance is reduced at withdraw' do
		subject.withdraw(5, 1234, account)
		expect(subject.balance).to eq 995
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

	it 'returns at succeful withdraw' do
		expected_output = { status: true, message: 'success', date: Date.today, amount: 35, bills: [20,10,5]}
		expect(subject.withdraw(35, 1234, account)).to eq expected_output
	end
end
