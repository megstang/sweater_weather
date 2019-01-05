
require 'rails_helper'

describe 'as a user' do
  it 'I can send a request to /api/v1/favorites?location=Denver,CO&api_key=[api_key]' do

    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    api_key = User.last.api_key
    user = User.find_by(email: "whatever@example.com")
    post "/api/v1/favorites?location=denver,co&api_key=#{api_key}"

    expect(user.favorites.count).to eq(1)
    expect(user.favorites.first.city).to eq("denver,co")
    expect(user.favorites.first.user_id).to eq(user.id)
  end

  it 'returns 401 if no api_key provided' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    api_key = User.last.api_key
    user = User.find_by(email: "whatever@example.com")
    post "/api/v1/favorites?location=denver,co&api_key="

    expect(user.favorites.count).to eq(0)
    expect(response.status).to eq(401)
  end

  xit 'can get the favorite cities from get request' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    api_key = User.last.api_key
    post "/api/v1/favorites?location=denver,co&api_key=#{api_key}"
    post "/api/v1/favorites?location=hershey,pa&api_key=#{api_key}"

    get "/api/v1/favorites?api_key=#{api_key}"

    expect(response).to be_successful
    expect(JSON.parse(response.body)["data"]["attributes"]["favorites"].count).to eq(2)

    # user = User.find_by(email: "whatever@example.com")

  end

end
