require 'station'

describe Station do
  it "checks the station name given to the class" do
    station = Station.new("Victoria", 2)
    expect(station.station_name).to eq "Victoria"
  end
end
 
