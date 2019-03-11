require 'oystercard'

describe Oyster do

it 'freshly initialized card has a balance of 0' do
expect(subject.balance).to eq 0
end

it {is_expected.to respond_to(:top_up).with(1).argument }

it "checks the top up amount added to balance" do
  expect(subject.top_up(20)).to eq 20
end

it 'raises error if balance exceeds £90' do
  expect{subject.top_up(91)}.to raise_error 'Max limit £90'
end

#  it {is_expected.to respond_to(:deduct).with(1).argument }

# it "deducts the fare from oyster balance for the journey" do
#   subject.top_up(20)
#   expect(subject.deduct(3)).to eq 17
# end

it {is_expected.to respond_to(:touch_in)}
it {is_expected.to respond_to(:touch_out)}
it {is_expected.to respond_to(:in_journey?)}

it "calling touch_in updates in_journey to true" do
  subject.top_up(10)
  subject.touch_in
  expect(subject.in_journey?).to eq true
end

it "calling touch_out updates in_journey to false" do
  subject.top_up(10)
  subject.touch_out
  expect(subject.in_journey?).to eq false
end

it 'raises error if touch in is called whilst balance < 1' do
  expect{subject.touch_in}.to raise_error 'Minimum balance of £1 required'
end

# it "deducts minimum fare on touch out" do
#   subject.top_up(10)
#   subject.touch_in
#   expect(subject.touch_out).to eq 9
# end

it 'deducts minimum fare on touch out' do
  subject.top_up(10)
  subject.touch_in
  expect {subject.touch_out}.to change{subject.balance}.by (-1)
end

end