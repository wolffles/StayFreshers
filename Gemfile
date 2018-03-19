source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :production do
  #This gem enables serving assets in production and setting your logger to standard out, both of which are required to run a Rails 4 application on a twelve-factor provider. The gem also makes the appropriate changes for Rails 3 apps.
  gem 'rails_12factor'
end


group :development do
  #Better Errors replaces the standard Rails error page with a much better and more useful error page. It is also usable outside of Rails in any Rack app as Rack middleware.
  gem 'better_errors'
  # Using binding_of_caller we can grab bindings from higher up the call stack and evaluate code in that context. Allows access to bindings arbitrarily far up the call stack, not limited to just the immediate caller.
  gem 'binding_of_caller'
  # The Listen gem listens to file modifications and notifies you about the changes. Works everywhere!
  gem 'listen', '~> 3.0.5'
end

 group :development, :test do
   gem 'rspec-rails'
   gem 'shoulda'
   gem 'factory_bot_rails'
   #tells you what line you've covered in rails
   gem 'simplecov'
   gem 'pry-rails'
   #allows for view render testing.
   gem 'rails-controller-testing'
   #records responses onto cassette tapes
   gem 'vcr'

 end

 group :test do
   gem 'database_cleaner'
 end
 # Use pg as the production database for Active Record
 gem 'pg'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use sqlite3 as the database for Active Record

gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use jquery as the JavaScript library
gem 'jquery-rails'
#
gem 'bootstrap-sass', '3.3.6'

#used for creating user authentication
gem 'devise'
#enables yaml files,
gem 'figaro'

#allows for a scalable authorization system for roles using policy/ scopes
gem 'pundit'

# Use redcarpet for allowing markdown syntax
gem 'redcarpet'

#allows for an imported theme. add it to
 gem 'bootswatch-rails'
#helps create fake data
 gem 'faker'
#builds ontop of the elastic search library aiming to simplify intergration of ruby classes.
 gem 'elasticsearch-model'
#companion to the -models library providing features that is suitible for ruby on rails applications.
 gem 'elasticsearch-rails'
