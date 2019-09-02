# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  before_validation :ensure_session_token
  validates :email, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { in: 6..20 }, allow_nil: true

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil unless user && user.is_password?(password)
    user
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_pass)
    @password = new_pass
    self.password_digest = Password.create(@password)
  end

  def is_password?(test_pass)
    bcrypt_pass = Password.new(self.password_digest) # Turns password_digest back into bcrypt object
    bcrypt_pass.is_password?(test_pass)
  end
end
