include EmailSender

get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users' do
  @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :"users/new"
  end
end







get '/users/reset_password' do
  erb :"/users/reset_password"
end

post '/users/reset_password/' do
  email_reset = params[:email_reset]
  user = User.first(email: email_reset)
  user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
  user.password_token_timestamp = Time.now
  user.save
  send_email(user)
  flash[:notice] = "Please check your email for your password reset link."
  redirect to('/')
end

get '/users/reset_password/:token' do |token|
  @user = User.first(password_token: token)
  if @user
    erb :"/users/new_password"
  else
    flash[:notice] = "Invalid token"
    redirect to '/users/reset_password'
  end
end

post '/users/new_password/' do
  user = User.first(password_token: params[:password_token])

end