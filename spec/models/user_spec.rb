require 'spec_helper'

RSpec.describe User do
  subject { described_class }

  context 'validations' do
    it 'validates email format' do
      user = subject.new(email: 'aaa')

      expect(user).not_to be_valid
      expect(user.errors.messages).to include ({ email: ['is invalid'] })
    end

    it 'validates password presence' do
      user = subject.new(password: nil)

      expect(user).not_to be_valid
      expect(user.errors.messages).to include ({ password: ['can\'t be blank'] })
    end
  end

  context 'password' do
    it 'creates a hashed password for a user' do
      password = '1234567'
      user = subject.create(email: 'test@test.com', password: password)

      expect(user.password).to eq(Digest::SHA1.hexdigest(password))
    end
  end

  describe '#authenticate' do
    it 'authenticates a given user' do
      subject.create(email: 'test@test.com', password: '12345')
      expect(User.find_by(email: 'test@test.com').authenticate('12345')).to be_truthy
    end
  end
end
