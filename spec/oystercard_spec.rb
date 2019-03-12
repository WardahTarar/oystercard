require 'oystercard'


describe Oyster do
    let(:victoria) {double :station}
    let(:waterloo) {double :station}

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

  it 'raises error if balance + top up amount exceeds £90' do
    subject.top_up(45)
    expect{subject.top_up(50)}.to raise_error 'Max limit £90'
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
    subject.touch_in(victoria)
    expect(subject.in_journey?).to eq true
  end

  it "calling touch_out updates in_journey to false" do
    subject.top_up(10)
    subject.touch_out(waterloo)
    expect(subject.in_journey?).to eq false
  end

  it 'raises error if touch in is called whilst balance < 1' do
    expect{subject.touch_in(victoria)}.to raise_error 'Minimum balance of £1 required'
  end

  it "deducts minimum fare on touch out" do
    subject.top_up(10)
    subject.touch_in(victoria)
    expect(subject.touch_out(waterloo)).to eq 9
  end

  it 'deducts minimum fare on touch out' do
    subject.top_up(10)
    subject.touch_in(victoria)
    expect {subject.touch_out(waterloo)}.to change{subject.balance}.by (-1)
  end

  it 'shows us the station for oyster touch in' do
    subject.top_up(10)
    subject.touch_in(victoria)
    expect {subject.touch_out(waterloo)}.to change{subject.balance}.by (-1)
  end

  it 'card remembers touch in station' do
    subject.top_up(10)
    subject.touch_in(victoria)
    expect(subject.entry_station).to eq victoria
  end

  it 'card forgets the entry station on touch out' do
    subject.top_up(10)
    subject.touch_in(victoria)
    subject.touch_out(waterloo)
    expect(subject.entry_station).to eq nil
  end

  it "checks that oyster card has an empty list of journeys by default" do
    expect(subject.journey_history).to eq []
  end

  it 'card forgets the entry station on touch out' do
    subject.top_up(10)
    subject.touch_in(victoria)
    subject.touch_out(waterloo)
    expect(subject.exit_station).to eq waterloo
  end

end