require 'rails_helper'

describe "Geocode Service", type: :service do
  it "returns coords for location" do

    VCR.use_cassette('geocode_request') do
      location = "denver,co"
      @service = GeocodeService.new(location)
      results = @service.coords

      expect(results).to eq({:lat=>39.7392358, :lng=>-104.990251})
    end
  end
end
