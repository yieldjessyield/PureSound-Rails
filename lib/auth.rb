require 'jwt'

class Auth

  SECRET_KEY = Rails.application.secrets[:secret_key_base]
  ALGORITHM = "HS256"

  def self.issue(payload)
    JWT.encode(payload, SECRET_KEY, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token,
      SECRET_KEY,
      true,
      { algorithm: ALGORITHM }).first
  end

end
