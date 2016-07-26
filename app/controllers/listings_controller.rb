get '/listings' do
  @listings = Listing.all
  @logged_in_user = User.find(session[:user_id])
  erb :'listings/index'
end

get '/listings/new' do
  @logged_in_user = User.find(session[:user_id])
    erb :'listings/new'
end

get '/listings/:id' do
  @listing = Listing.find(params[:id])
  erb :'listings/show'
end

post '/listings' do
  @listing = Listing.new(title: params[:title], location: params[:location], price: params[:price].to_i, description: params[:description])
  if @listing.save
    redirect '/listings'
  else
    @message = "Something went wrong. Try again"
    redirect '/listings/new'
  end
end
