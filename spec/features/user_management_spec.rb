require 'spec_helper'
require_relative 'helpers/session'
	
include SessionHelpers

feature "User signs up" do
#strictly speaking, the tests that check the UI
#(have content, etc.) should be separate from the tests
#that check what we have in the DB. The reason is that
# you should test one thing at a time, whereas
# by mixing the two we're testing both
# the business logic and the views.
#
# However, let's not worry about this yet
# to keep the example simple.

	scenario "when being logged out" do 
	    # lambda { sign_up }.should change(User, :count).by(1)    
	expect{ sign_up }.to change(User, :count).by(1)
	expect(page).to have_content("Welcome, alice@example.com")
	expect(User.first.email).to eq("alice@example.com")	
	end

	scenario "with a password that doesn't match" do 
	expect{ sign_up('a@a.com', 'pass','wrong') }.to change(User, :count).by(0)
	expect(current_path).to eq('/users')
	expect(page).to have_content("Sorry, your passwords don't match")
	end

	scenario "with an email that is already registered" do 
		expect{sign_up}.to change(User, :count).by(1)
		expect{sign_up}.to change(User, :count).by(0)
		expect(page).to have_content("This email is already taken")
	end
# added this
end 

feature "User signs in" do 

	before(:each) do 
		User.create(:email => "test@test.com",
					:password => 'test',
					:password_confirmation => 'test')
	end

	scenario "with correct credentials" do 
		visit '/'
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com','test')
		expect(page).to have_content("Welcome, test@test.com")
	end

	scenario "with incorrect credentials" do 
		visit '/' 
		expect(page).not_to have_content("Welcome, test@test.com")
		sign_in('test@test.com','wrong')
		expect(page).not_to have_content("Welcome, test@test.com")
	end

	# def sign_in(email, password)
	# 	visit '/sessions/new'
	# 	fill_in 'email', :with => email
	# 	fill_in	'password', :with => password
	# 	click_button 'Sign in'
	# end

end

feature 'User signs out' do

  before(:each) do
    User.create(:email => "test@test.com",
                :password => 'test',
                :password_confirmation => 'test')
  end

  scenario 'while being signed in' do
    sign_in('test@test.com', 'test')
    click_button "Sign out"
    expect(page).to have_content("Good bye!") # where does this message go?
    expect(page).not_to have_content("Welcome, test@test.com")
  end

end







	# def sign_up(email = "alice@example.com", password = "oranges!",password_confirmation = "oranges!")
	# 	visit '/users/new'
	# 	#expect(page.status_code).to eq(200)
	# 	fill_in :email, :with => email
	# 	fill_in :password, :with => password
	# 	fill_in :password_confirmation, :with => password_confirmation
	# 	click_button "Sign up"
	# end

	# feature 'User requests password' do 

	# 	scenario 'before signing in' do 

	# 		click_button "Forgotten password"
	# 		expect(page).to have_content("")
	# 	end

	# end

#end