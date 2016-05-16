require './lib/account.rb'

describe Account do
	let(:person) {double(:person, name: 'Simon')}
	subject {described_class.new(person)}

	it 'generates a random pin on initialize' do
		pin_digits = Math.log10(subject.pin).to_i + 1
		expect(pin_digits).to eq 4
	end

	it 'has expiry date on initialize' do
		expected_date = Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%Y')
		expect(subject.expiry_date).to eq expected_date
	end

	it 'has zero balance on initialize' do
		expect(subject.balance).to eq 0
	end

	it 'has optional balance' do
		account = described_class.new(person, balance: 100)
		expect(account.balance).to eq 100
	end

	it 'requires an owner' do
		expect(subject.owner).to eq person
	end

  it 'deactivates account using Class method' do
    Account.deactivate(subject)
    expect(subject.account_status).to eq :deactivated
  end
end