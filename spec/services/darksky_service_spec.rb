require 'rails_helper'

describe "Darksky Service", type: :service do

  before(:each) do
    VCR.use_cassette('dark_sky_request') do
      city = "denver,co"

      @location = {:lat=>39.7392358, :lng=>-104.990251}
      @service = DarkskyService.new(@location[:lat],@location[:lng])

      @results = @service.forecast_data
    end
  end

  it "returns coords for location" do
    expect(@results[:latitude]).to eq(@location[:lat])
    expect(@results[:longitude]).to eq(@location[:lng])
  end

end
