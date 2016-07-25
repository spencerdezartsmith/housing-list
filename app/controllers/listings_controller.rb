get '/listings' do
  @listings = Listing.all
  @user = User.find(session[:user_id])
  erb :'listings/index'
end
