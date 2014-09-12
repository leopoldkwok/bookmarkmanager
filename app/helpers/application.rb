helpers do
	API_KEY = ENV['MAILGUN_API_KEY']
	API_URL = "https://api:#{API_KEY}@api.mailgun.net/v2/sandbox75378a98fbd8489b8a00d364421afe72.mailgun.orgg"

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end

	def send_token_email(user_email, password_token)
		RestClient.post API_URL+"/messages",
		:from => "postmaster@sandbox75378a98fbd8489b8a00d364421afe72.mailgun.org", 
		:to => user_email, 
		:subject => "Recovery password", 
		:text => "Please click following link to recover your password: http://http://bookmarkmanager-leopoldkwok.herokuapp.com/users/password_reset_confirmation/#{password_token}"
	end

end