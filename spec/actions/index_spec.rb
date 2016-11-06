require 'spec_helper'

RSpec.describe 'main page' do
  describe 'get /' do
    it 'shows the main page' do
      get '/'

      expect(last_response).to be_ok
    end
  end
end
