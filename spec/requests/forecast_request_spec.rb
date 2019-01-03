require 'rails_helper'

describe 'making a forecast api' do

  it '/api/v1/forecast?location=denver,co' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end

describe 'making a user api and response' do

  it '/api/v1/users' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    expect(response).to be_successful
    expect(response[:api_key]).to eq(User.last[:api_key])
    expect(User.last.email).to eq('whatever@example.com')
  end

end
