get '/' do
  erb :index
end

get '/listings' do
  @listings = Listing.all
  @logged_in_user = User.find(session[:user_id])
  erb :'listings/index'
end

get '/listings/new' do
  @logged_in_user = User.find(session[:user_id])
    erb :'listings/new'
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

get '/listings/:id' do
  @listing = Listing.find(params[:id])
  erb :'listings/show'
end

post '/listings' do
  listing = Listing.new(title: params[:title], location: params[:location], price: params[:price].to_i, description: params[:description])
  if listing.save
    redirect '/listings'
  else
    @message = "Something went wrong. Try again"
    redirect '/listings/new'
  end
end

get '/token' do
  @logged_in_user = User.find(session[:user_id])
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
