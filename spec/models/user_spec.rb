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
end
