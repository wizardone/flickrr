require 'spec_helper'

RSpec.describe 'register page' do
  describe 'GET register' do

    it 'shows the register page' do
      get '/register'

      expect(last_response).to be_ok
    end
  end

  describe 'POST register' do

    let(:data) do
      { user: { email: 'test@test.com', password: '12345', password_confirmation: '12345' } }
    end
    it 'creates a new user' do
      expect {
        post '/register', data
      }.to change { User.count }.by(1)
    end

    it 'redirects to the search page' do
      post '/register', data
      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/search')
    end

    it 'renders the registration form if there are errors' do
      post '/register', 'user[email]=wat?'
      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/register')
    end
  end
end
