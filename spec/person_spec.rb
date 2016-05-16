require './lib/person.rb'
require './lib/atm'

describe Person do
	subject {described_class.new('Simon', 0)}

	it 'is expected to have a :name on initialize' do
		expect(subject.name).to eq 'Simon'
	end

   it 'is expected to have a :cash attribute with value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it 'is expected to have a :account attribute' do
    expect(subject.account).to be nil
  end
end