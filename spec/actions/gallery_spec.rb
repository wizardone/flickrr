require 'spec_helper'

RSpec.describe 'Gallery actions' do
  let(:user) { User.create(email: 'a@a.com', password: '12345') }

  context 'not logged in' do
    it 'redirects back to the main page' do
      get '/gallery'

      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/')
    end
  end

  context 'logged in' do
    describe 'GET gallery' do
      it 'shows the gallery page' do
        get '/gallery', {}, 'rack.session' => { user_id: user.id }

        expect(last_response).to be_ok
      end
    end

    describe 'GET search' do
      it 'searches for images in Flickr' do
        get '/search', { search: { text: 'australia'} }, 'rack.session' => { user_id: user.id }

        expect(last_response).to be_ok
      end

      it 'redirects back to the search page if no text is supplied' do
        get '/search', {}, 'rack.session' => { user_id: user.id }

        follow_redirect!

        expect(last_response).to be_ok
        expect(last_request.url).to eq('http://example.org/gallery')
      end

      it 'saves the search query in the history' do
        expect {
          get '/search', { search: { text: 'australia'} }, 'rack.session' => { user_id: user.id }
        }.to change { History.count }.by(1)
      end
    end
  end
end
