post '/login' do
  @user = User.find_by(email: params[:email])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/listings'
  else
    @error = 'Your email or password was incorrect. Please try again.'
    erb :index
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
# get code and check if it exists. if so show registration form. if not redirect
get '/user/new' do
  @code = Token.find_by(code: params[:code]).code
  if token_check(@code)
    erb :'/users/new'
  else
    @error = "You need a registration code to sign up. Ask a friend!"
    erb :index
  end
end

post '/user' do

end
