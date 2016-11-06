require 'spec_helper'

RSpec.describe History do
  let!(:user) do
    User.create(email: 'test@test.com',
                password: '123',
                password_confirmation: '123')
  end

  context 'deletion of old search history' do
    it 'removes old search history' do
      (1..10).each do |i|
        user.histories.create(data: "searching for #{i}")
      end
      expect(History.count).to eq(10)

      user.histories.create(data: 'my 11-th search')

      expect(History.count).to eq(10)
    end
  end
end
