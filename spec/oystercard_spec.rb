require 'oystercard'

describe Oyster do

it 'freshly initialized card has a balance of 0' do
expect(Oyster::DEFAULT_BALANCE).to eq 0
end


end