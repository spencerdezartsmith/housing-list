
get '/users/new' do
  if token_check(params[:code])
    token_check(params[:code]).destroy
    erb :'/users/new'
  else
    @error = "You need a registration code to sign up. Ask a friend!"
    erb :index
  end
end

get '/profile' do
  @logged_in_user = current_user
  erb :'/profile/show'
end

get '/users/:id' do
  @logged_in_user = current_user
  @user = User.find(params[:id])
  erb :'/users/show'
end

post '/users' do
  @user = User.new(full_name: params[:full_name], email: params[:email], password: params[:password], description: params[:description], phone_number: params[:phone_number])
  if @user.save
    session[:user_id] = @user.id
    redirect '/listings'
  else
    @error = "Something went wrong. Please try again"
    erb :'/users/new'
  end
end

get '/users/:id/edit' do
  @current_user = current_user
 'hello world'

end
