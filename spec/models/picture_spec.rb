require 'spec_helper'

RSpec.describe Picture do
  subject { described_class }

  let(:params) { { id: 1, server_id: 2, farm_id: 3, secret: 'bogus' } }
  describe '#initialize' do
    it 'assigns arguments to the Picture object' do
      picture = subject.new(params)

      expect(picture.params).not_to be_nil
    end
  end

  describe '#url' do
    it 'constructs the url for the flickr image' do
      picture = subject.new(params)

      expect(picture.url)
        .to eq("http://farm#{params[:farm_id]}.staticflickr.com/#{params[:server_id]}/#{params[:id]}_#{params[:secret]}")
    end
  end
end
