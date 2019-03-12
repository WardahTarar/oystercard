require 'station'

describe Station do
it "checks for station name" do
  expect(subject.name).to eq nil
end

it "checks for station zone" do
  expect(subject.zone).to eq nil
end

end