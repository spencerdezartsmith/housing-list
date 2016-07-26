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

post '/users/:code' do
  @user = User.new(full_name: params[:full_name], email: params[:email], password: params[:password], description: params[:description])
  if @user.save
    session[:user_id] = @user.id
  else
    @error = "Something went wrong. Please try again"
  end
end
