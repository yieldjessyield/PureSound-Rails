class User < ApplicationRecord
  has_secure_password
  has_many :user_artists
  has_many :artists, through: :user_artists

  validates :email, uniqueness: true
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  # validates :phone_number, length: {is: 10}

end
