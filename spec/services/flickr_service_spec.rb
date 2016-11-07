require 'spec_helper'

RSpec.describe FlickrService do
  describe '#initialize' do
    it 'initializes the flickr library' do
      flickr = described_class.new

      expect(flickr.service).to be_present
    end
  end

  describe '#photos' do
    it 'returns a list of photos by criteria' do
      VCR.use_cassette('flickr_search') do
        flickr_response = described_class.new.photos({ text: 'australia'})

        expect(flickr_response).to be_a(Array)
        expect(flickr_response.first).to be_a(Picture)
        expect(flickr_response.first.title).to eq('Dunsborough')
      end
    end
  end

  describe '#recent_photo' do
    it 'fetches the latest photo uploaded to flickr' do
      VCR.use_cassette('flickr_recent_photo') do
        flickr_response = described_class.new.recent_photo

        expect(flickr_response).to be_a(Picture)
        expect(flickr_response.title).to include('#foodfun #foodporn #foodhunt')
      end
    end
  end
end
