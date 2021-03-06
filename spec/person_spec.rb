require './lib/person.rb'
require './lib/atm'

describe Person do
  subject { Person.new(name: 'Simon', cash: 0) }

  it 'is expected to have a :name on initialize' do
    expect(subject.name).to eq 'Simon'
  end

  it 'is expected to have a :cash attribute with value of 0 on initialize' do
    expect(subject.cash).to eq 0
  end

  it 'is expected to have a :account attribute' do
    expect(subject.account).to be nil
  end

  it 'is expected to raise error if no name is set' do
    expect { described_class.new }.to raise_error 'A name is required'
  end
end
