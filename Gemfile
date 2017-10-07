source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :production do
  # Use pg as the production database for Active Record
  gem 'pg'
  gem 'rails_12factor'
end


group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'sqlite3'
  gem 'listen', '~> 3.0.5'
end

 group :development, :test do
   gem 'rspec-rails'
   gem 'shoulda'
   gem 'faker'
   gem 'factory_girl_rails'
   gem 'simplecov'
   gem 'pry-rails'
   gem 'vcr' #records responses onto cassette tapes
 end
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
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
