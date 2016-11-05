require 'spec_helper'

RSpec.describe 'main page' do
  context 'registered user' do
    
  end

  context 'unregistered user' do
    it 'redirects to the register page' do
      get '/'
      follow_redirect!

      expect(last_response).to be_ok
      expect(last_request.url).to eq('http://example.org/register')
    end
  end
end
