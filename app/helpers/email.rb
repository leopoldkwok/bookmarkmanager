module EmailSender

	def send_email(user)
		RestClient.post "https://api:key-b53c5d3e879ba56cf0d124d2d7aa62cf"\
		"@api.mailgun.net/v2/sandbox75378a98fbd8489b8a00d364421afe72.mailgun.org/messages",
  	:from => "postmaster@sandbox75378a98fbd8489b8a00d364421afe72.mailgun.org",
  	:to => "#{user.email}",
  	:subject => "Password Reset",
  	:text => "To reset your password, please visit http://localhost:9292/users/reset_password/#{user.password_token}"
	end

end


	# def send_token_email(user_email, password_token)
	# 	RestClient.post API_URL+"/messages",
	# 	:from => "postmaster@sandbox75378a98fbd8489b8a00d364421afe72.mailgun.org", 
	# 	:to => user_email, 
	# 	:subject => "Recovery password", 
	# 	:text => "Please click following link to recover your password: please visit http://localhost:9292/users/reset_password/#{user.password_token}"
	# end
