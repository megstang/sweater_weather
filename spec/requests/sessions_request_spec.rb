require 'rails_helper'

describe 'as a user' do
  it 'I can send a request to /api/v1/sessions and get api_key' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    post '/api/v1/sessions?email=whatever@example.com&password=password'

    expect(response).to be_successful
    login = JSON.parse(response.body,symbolize_names: true)
    expect(login[:data][:attributes][:api_key]).to eq(User.last.api_key)
  end

  it 'raises an error when i try logging in with wrong credentials' do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'
    post '/api/v1/sessions?email=dog@example.com&password=dog'

    login = JSON.parse(response.body,symbolize_names: true)
    expect(login[:error]).to eq("not-found")
  end
end
