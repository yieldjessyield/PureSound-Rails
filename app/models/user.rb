class User < ApplicationRecord
has_secure_password
has_many :user_artists
has_many :artists, through: :user_artists

end
