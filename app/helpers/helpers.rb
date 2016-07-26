require 'securerandom'

helpers do
  def token_generator
    SecureRandom.hex(4)
  end

  def token_check(code)
    p code
    Token.find_by(code: code)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
