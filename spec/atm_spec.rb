require './lib/atm.rb'
describe Atm do
	it 'has 1000$ on int.' do
		expect(subject.balance).to eq 1000
	end

	it 'balance is reduced at withdraw' do
		subject.withdraw 5
		expect(subject.balance).to eq 995
	end
end