require 'oystercard'

describe Oyster do

it 'freshly initialized card has a balance of 0' do
expect(subject.balance).to eq 0
end

it {is_expected.to respond_to(:top_up).with(1).argument }

it "checks the top up amount added to balance" do
  expect(subject.top_up(100)).to eq 100
end

end