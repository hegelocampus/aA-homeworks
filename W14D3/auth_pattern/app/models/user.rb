class User < ApplicationRecord
  has_secure_password

  after_initialize :ensure_session_token
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  attr_accessor :password

  def self.Find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user : nil
  end

  def self.Generate_session_token
    SecureRandom.urlsafe_base64
  end

  def ensure_session_token
    self.session_token ||= User.Generate_session_token
  end

  def reset_session_token
    self.session_token = User.Generate_session_token
    self.save!
  end

  def is_password?(password)
    self.authenticate(password)
  end
end
