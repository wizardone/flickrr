require 'spec_helper'

RSpec.describe 'main page' do
  describe 'GET logout' do
    it 'logs out the current user' do
      get '/logout', nil, 'rack.session' => { user_id: 'some' }

      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/')
    end
  end
end
