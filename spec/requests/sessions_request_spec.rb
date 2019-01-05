require 'rails_helper'

describe 'as a user' do
  it 'I can send a request to /api/v1/sessions and get api_key' do
    user_1 = User.create(email: "whatever@example.com",password: "password", password_confirmation: "password")
    user_2 = User.create(email: "cat@example.com",password: "cat", password_confirmation: "cat")
    post '/api/v1/sessions?email=whatever@example.com&password=password'

    expect(response).to be_successful
    login = JSON.parse(response.body,symbolize_names: true)
    expect(login[:data][:attributes][:api_key]).to eq(user_1.api_key)
  end

  it 'raises an error when i try logging in with wrong credentials' do
    user_1 = User.create(email: "whatever@example.com",password: "password", password_confirmation: "password")
    user_2 = User.create(email: "cat@example.com",password: "cat", password_confirmation: "cat")
    post '/api/v1/sessions?email=dog@example.com&password=dog'

    login = JSON.parse(response.body,symbolize_names: true)
    expect(login[:error]).to eq("not-found")
  end
end
