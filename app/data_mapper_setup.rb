env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment

DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{env}")

#Then, let's save the user id in the session after it's created (/server.rb).



#require 'data_mapper'

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
# DataMapper.auto_upgrade!