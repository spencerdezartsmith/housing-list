post '/login' do
  p params
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

post '/users' do
  "hello world"
  p params

end
