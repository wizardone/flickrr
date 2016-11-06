require 'spec_helper'

RSpec.describe 'Logout actions' do
  let(:user) do
    User.create(email: 'test@test.com',
                password: '12345',
                password_confirmation: '12345')
  end
  describe 'GET logout' do
    it 'logs out the current user' do
      VCR.use_cassette('flickr_recent_photo') do
        get '/logout', nil, 'rack.session' => { user_id: user.id }

        follow_redirect!

        expect(last_response).to be_ok
        expect(last_request.url).to eq('http://example.org/')
      end
    end
  end
end
