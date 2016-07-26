get '/token' do
  @logged_in_user = User.find(session[:user_id])
  @token = @logged_in_user.tokens.last
  erb :'tokens/index'
end

post '/token/new' do
  @token = Token.new(code: token_generator, generator_id: session[:user_id])
  if @token.save
    redirect '/token'
  else
    @error = 'Something went wrong. Please try again'
    erb :'tokens/index'
  end
end
