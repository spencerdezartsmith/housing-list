get '/listings' do
  @listings = Listing.all
  @logged_in_user = User.find(session[:user_id])
  erb :'listings/index'
end

get '/listings/new' do
  @logged_in_user = User.find(session[:user_id])
  if request.xhr?
    erb :'listings/_new_listing', layout: false
  else
    erb :'listings/new'
  end
end

get '/listings/:id' do
  @listing = Listing.find(params[:id])
  erb :'listings/show'
end

post '/listings' do
  @listing = Listing.new(title: params[:title], location: params[:location], price: params[:price].to_i, description: params[:description])
  if @listing.save
    if request.xhr?
      erb :'listings/_listing', layout: false
    else
      redirect '/listings'
    end
  else
    @message = "Something went wrong. Try again"
    redirect '/listings/new'
  end
end
