class User < ApplicationRecord
  validates :username, :email, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 5, allow_nil: true}

  attr_reader :password

  after_initialize :ensure_session

  has_many :posts,
    foreign_key: :author_id

  def ensure_session
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session
    self.session_token = SecureRandom.urlsafe_base64
  end

  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end

  def is_password?(pass)
    BCrypt::Password.new(password_digest).is_password(pass)
  end

end
