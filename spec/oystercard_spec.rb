require 'oystercard'

describe Oyster do

it 'freshly initialized card has a balance of 0' do
expect(subject.balance).to eq 0
end

end