require 'spec_helper'

RSpec.describe 'Gallery actions' do
  describe 'GET gallery' do
    it 'shows the gallery page' do
      get '/gallery'

      expect(last_response).to be_ok
    end
  end

  describe 'GET search' do
    it 'searches for images in Flickr' do
      get '/search', { search: { text: 'australia'} }

      expect(last_response).to be_ok
    end

    it 'redirects back to the search page if no text is supplied' do
      get '/search'

      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/gallery')
    end
  end
end
