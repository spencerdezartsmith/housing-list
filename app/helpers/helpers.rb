require 'securerandom'

helpers do
  def token_generator
    SecureRandom.hex(4)
  end

  def token_check(code)
    Token.find_by(code: code)
  end
end
