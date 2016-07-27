get '/messages/new/:id' do
  @recipient = Listing.find(params[:id])

  erb :'/messages/new'
end

post '/messages' do
  # send_message
  @recipient = User.find_by(full_name: params[:recipient])
  @recipient.phone_number
  # @message = Message.new(body: params[:body], recipient_id: @recipient.id, sender_id: session[:user_id])
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  @client.account.messages.create({
    :from => '+16506677894',
    :to => @recipient.phone_number,
    :body => params[:body],
  })
  redirect '/listings'
end
