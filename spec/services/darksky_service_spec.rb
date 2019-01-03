require 'rails_helper'

describe "Darksky Service", type: :service do
  it "returns coords for location" do

    city = "denver,co"

    location = GeocodeService.new(city).coords
    service = DarkskyService.new(location[:lat],location[:lng])

    results = service.forecast_data

    expect(results[:latitude]).to eq(location[:lat])
    expect(results[:longitude]).to eq(location[:lng])
  end
end
