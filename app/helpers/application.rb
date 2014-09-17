module AppHelpers
	

	def current_user
		@current_user ||=User.get(session[:user_id]) if session[:user_id]
	end


end




# change the above into a module

# helpers do
	

# 	def current_user
# 		@current_user ||=User.get(session[:user_id]) if session[:user_id]
# 	end


# end