require './lib/atm.rb'

describe Atm do
	it 'has 1000$ on int.' do
		expect(subject.balance).to eq 1000
	end

	it 'balance is reduced at withdraw' do
		subject.withdraw 5
		expect(subject.balance).to eq 995
	end

	it 'expect withdraw of 15 to output bills array' do
		expect(subject.withdraw(15)).to eq({status: true, bills: [10, 5]})
	end

	it 'reject if amount is not devisiable by 5' do
		expect(subject.withdraw 6).to eq false
	end

end