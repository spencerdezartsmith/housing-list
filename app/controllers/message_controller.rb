get '/messages/new/:id' do
  @user = User.find(params[:id])

  erb :'/messages/new'
end

post '/messages' do
  @recipient = User.find_by(full_name: params[:recipient])
  @message = Message.create(body: params[:body], recipient_id: @recipient.id, sender_id: session[:user_id])
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']

  @client = Twilio::REST::Client.new(account_sid, auth_token)

  @client.account.messages.create({
    :from => '+16506677894',
    :to => @recipient.phone_number,
    :body => params[:body],
  })
  redirect '/messages/show'
end

post '/response' do
  @sender = User.find_by(phone_number: params['From'])
  @message = Message.find_by(sender_id: @sender.id).update_attributes(response: params['Body'])
end

get '/messages/show' do
  @user = current_user

  erb :'/messages/show'
end
