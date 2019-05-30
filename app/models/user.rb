class User < ApplicationRecord
  has_many :visits
  has_many :custom_visits
  has_many :destinations, through: :visits
  has_many :custom_destinations, through: :custom_visits

  validates :user_name, uniqueness: true

  has_secure_password

  attr_reader :password

  def current_user
    session[:user_id] ||= nil
  end

  def password=(password)
    @password = password
    salt = BCrypt::Engine::generate_salt
    hashed = BCrypt::Engine::hash_secret(password, salt)
    self.password_digest = salt + hashed
  end

  def authenticate(password)
    salt = password_digest[0..28]
    hashed = BCrypt::Engine::hash_secret(password, salt)
    return nil unless (salt + hashed) == self.password_digest
    self
  end

end
