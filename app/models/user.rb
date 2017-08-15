class User < ApplicationRecord
  before_save { self.email = email.downcase }
  has_many :microposts
  validates :name, presence: true    # Replace FILL_IN with the right code.
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }# Replace FILL_IN with the right code.
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
