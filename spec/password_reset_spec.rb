feature "User resets password" do
	
	include SessionHelpers
	include EmailSender

	before(:each) do
			User.create(email: "iforgot@password.com",
									password: 'password',
									password_confirmation: 'password',
									password_token: 'validtoken' )
	end

	scenario 'tries to reset password' do
		visit '/users/reset_password'
		expect(page).to have_content("Reset Password")
		fill_in 'email_reset', :with => "iforgot@password.com"
		click_button 'Reset password'
		expect(page).to have_content("Please check your email for your password reset link.")
	end



	scenario 'cannot sign in with old password' do
		visit '/sessions/new'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in("test@test.com", 'password')
		expect(page).not_to have_content("Welcome, test@test.com")
	end

	scenario 'cannot reset password without valid token' do
		visit '/users/reset_password/invalidtoken'
		expect(page).to have_content("Reset Password Request")
	end

	scenario 'can reset their password' do
		visit '/users/reset_password/validtoken'
		expect(page).to have_content("Please enter your new password")
	end

end