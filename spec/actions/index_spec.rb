require 'spec_helper'

RSpec.describe 'main page' do
  context 'registered user' do
  end

  context 'unregistered user' do
    it 'redirects to the register page' do
      get '/'

      expect(last_response).to be_ok
    end
  end
end
