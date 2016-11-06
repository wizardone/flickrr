require 'spec_helper'

RSpec.describe 'Gallery actions' do
  let(:user) do
    User.create(email: 'a@a.com', password: '12345', password_confirmation: '12345')
  end

  context 'not logged in' do
    it 'redirects back to the main page' do
      get '/search'

      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/')
    end
  end

  context 'logged in' do
    describe 'GET search' do
      it 'shows the search page' do
        get '/search', {}, 'rack.session' => { user_id: user.id }

        expect(last_response).to be_ok
      end
    end

    describe 'GET gallery' do
      it 'searches for images in Flickr' do
        get '/gallery', { search: { text: 'australia'} }, 'rack.session' => { user_id: user.id }

        expect(last_response).to be_ok
      end

      it 'redirects back to the search page if no text is supplied' do
        get '/gallery', {}, 'rack.session' => { user_id: user.id }

        follow_redirect!

        expect(last_response).to be_ok
        expect(last_request.url).to eq('http://example.org/search')
      end

      it 'saves the search query in the history' do
        expect {
          get '/gallery', { search: { text: 'australia'} }, 'rack.session' => { user_id: user.id }
        }.to change { History.count }.by(1)
      end

      it 'does not save the search query in the history if you are going through pagination' do
        expect {
          get '/gallery', { search: { text: 'australia'}, page: 5 }, 'rack.session' => { user_id: user.id }
        }.to_not change { History.count }
      end
    end
  end
end
