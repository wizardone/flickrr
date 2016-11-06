require 'spec_helper'

RSpec.describe 'Login actions' do
  let(:user) do
    User.create(email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345')
  end
  describe 'GET login' do
    it 'shows the login page' do
      get '/login'

      expect(last_response).to be_ok
    end

    it 'logs in the user' do
      post '/login', { user: { email: user.email, password: '12345' } }

      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/search')
    end

    it 'does not login the user' do
      post '/login', { user: { email: user.email, password: 'falsey' } }

      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/login')
    end
  end
end
