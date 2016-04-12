require './lib/atm.rb'

describe Atm do
	it 'has 1000$ on initializing.' do
		expect(subject.balance).to eq 1000
	end
  
	it 'balance is reduced at withdraw' do
		subject.withdraw 5
		expect(subject.balance).to eq 995
	end

	xit 'expect withdraw of 15 to output bills array' do
		expect(subject.add_bills(15)).to eq({status: true, bills: [10, 5]})
	end

	it 'reject if amount is not divisible by 5' do
		expect(subject.withdraw 6).to eq false
	end

	it 'returns at succeful withdraw' do
		expected_output = { status: true, message: 'success', date: Date.today, amount: 35, bills: [20,10,5]}
		expect(subject.withdraw 35).to eq expected_output
	end
end
