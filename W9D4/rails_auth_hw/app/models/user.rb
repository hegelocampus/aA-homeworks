require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  before_validation :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 5, maximum: 15 }, allow_nil: true
  attr_reader :password

  def self.find_by_credentials(username, pass)
    user = User.find_by(username: username)
    user.password_digest == user.pass ? (return user) : (return nil)
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_password)
    @password_digest = Password.create(new_password)
    self.password_digest = @password_digest
  end
end
