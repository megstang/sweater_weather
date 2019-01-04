require 'rails_helper'

describe 'as a user' do
  it 'I can send a request to /api/v1/gifs?location=denver,co and get time,summary,url' do
    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
    giphys = JSON.parse(response.body,symbolize_names: true)
    expect(giphys[:data][:daily_forecasts].length).to eq(8)
    expect(giphys[:data][:daily_forecasts][0]).to have_key(:time)
    expect(giphys[:data][:daily_forecasts][0]).to have_key(:summary)
    expect(giphys[:data][:daily_forecasts][0]).to have_key(:url)
    expect(giphys[:data][:daily_forecasts][0]).to have_key(:url)
    expect(giphys[:copyright]).to eq("2018")
  end
end
