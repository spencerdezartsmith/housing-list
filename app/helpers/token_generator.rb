require 'securerandom'

helpers do
  def token_generator
    SecureRandom.hex(4)
  end
end
