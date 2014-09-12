get '/users/new' do
  # note the view is in views/users/new.erb
  # we need the quotes because otherwise
  # ruby would divide the symbol :users by the
  # variable new (which makes no sense)
  @user = User.new
  erb :"users/new"
end


post '/users' do
  # we just initialize the object
  # without saving it. It may be invalid
  @user = User.new(:email => params[:email], 
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])  
  # let's try saving it
  # if the model is valid,
  # it will be saved
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
    # if it's not valid,
    # we'll show the same
    # form again
  else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
  end

end

# this is new
get '/users/password_reset_request' do 
  erb :"users/password_reset_request"
end


get '/users/reset_password/:token' do
    user = User.first(:email => email)
    # avoid having to memorise ascii codes
    user.password_token = (1..64).map{('A'..'Z').to_a.sample}.join
    user.password_token_timestamp = Time.now
    user.save

    # this is new
    send_token_email(params[:email], user.password_token)
    flash[:notice] = "Please check your email to complete password reset"
    redirect to 'sessions/new'
end


# this is new
get '/users/password_reset_confirmation/:token' do 
  erb :"users/password_reset_confirmation"
end

# this is new
post '/users/password_reset_confirmation' do 
  user = User.first(:password_token => params[:token])
  user.password=(params[:password])
  flash[:notice] = "Your password has been reset, please sign in"
  redirect to 'sessions/new'
end