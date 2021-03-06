require 'digest/sha2'

class User < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  validates :password, length: { in: 4..10 }, confirmation: true
  validates :password_confirmation, presence: true

  has_many :histories, dependent: :destroy

  before_create :generate_password

  def authenticate(password)
    Digest::SHA1.hexdigest(password) == self.password
  end

  private

  def generate_password
    if self.password.present?
      self.password = Digest::SHA1.hexdigest(self.password)
    end
  end
end
