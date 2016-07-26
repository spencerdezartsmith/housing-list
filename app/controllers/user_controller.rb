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

get '/profile' do
  @logged_in_user = User.find(session[:user_id])
  erb :'/users/show'
end

get '/users/:id' do
  @logged_in_user = User.find(session[:user_id])
  @user = User.find(params[:id])
  erb :'/users/show'
end
