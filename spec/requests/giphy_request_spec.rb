require 'rails_helper'

describe 'as a user' do
  it 'I can send a request to /api/v1/gifs?location=denver,co and get time,summary,url' do
    VCR.use_cassette('giphy_request') do
      get '/api/v1/gifs?location=denver,co'

      expect(response).to be_successful
      giphys = JSON.parse(response.body,symbolize_names: true)
      expect(giphys[:data][:attributes][:daily_forecasts].length).to eq(5)
      expect(giphys[:data][:attributes][:daily_forecasts][0]).to have_key(:time)
      expect(giphys[:data][:attributes][:daily_forecasts][0]).to have_key(:summary)
      expect(giphys[:data][:attributes][:daily_forecasts][0]).to have_key(:url)
      expect(giphys[:data][:attributes][:daily_forecasts][0]).to have_key(:url)
      expect(giphys[:data][:attributes][:copyright]).to eq("2019")
    end
  end
end
