require 'spec_helper'

RSpec.describe Picture do
  subject { described_class }

  let(:params) { { id: 1, server_id: 2, farm_id: 3, secret: 'bogus' } }

  describe '.from_flickr' do
    it 'returns a new instance of Picture' do
      flickr_photo = { 'id' => 1,
                       'server' => 2,
                       'farm' => 3,
                       'secret' => 'bogus' }
      expect(Picture).to receive(:new).with(params)

      Picture.from_flickr(flickr_photo)
    end
  end

  describe '#initialize' do
    it 'assigns arguments to the Picture object' do
      picture = subject.new(params)

      expect(picture.params).not_to be_nil
    end
  end

  describe '#thumb_url' do
    it 'constructs the url for the flickr image' do
      picture = subject.new(params)

      expect(picture.thumb_url)
        .to eq("http://farm#{params[:farm_id]}.staticflickr.com/#{params[:server_id]}/#{params[:id]}_#{params[:secret]}_t.jpg")
    end
  end

  describe '#original_url' do
    it 'constructs the url for the flickr image' do
      picture = subject.new(params)

      expect(picture.original_url)
        .to eq("http://farm#{params[:farm_id]}.staticflickr.com/#{params[:server_id]}/#{params[:id]}_#{params[:secret]}_b.jpg")
    end
  end
end
