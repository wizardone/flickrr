require 'spec_helper'

RSpec.describe 'Login actions' do
  describe 'GET login' do
    it 'shows the login page' do
      get '/login'

      expect(last_response).to be_ok
    end

    it 'logs in the user' do
      user = User.create(email: 'test@test.com', password: '12345')

      post '/login', { user: { email: user.email, password: '12345' } }

      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/gallery')
    end
  end
end
