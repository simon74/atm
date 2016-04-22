require './lib/person.rb'

describe Person do
	subject {described_class.new('Simon', 0)}

	it 'has zero cash on initialize' do
		expect(subject.cash).to eq 0
	end

end