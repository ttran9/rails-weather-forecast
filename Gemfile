source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0', '>= 6.0.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 4.3', '>= 4.3.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Add support for testing.
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  # Add the ability to grab keys from .env file
  gem 'dotenv-rails'
  # Help with creating test data
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  # helps with cleaning the database.
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# help with authentication
gem 'devise', '~> 4.7.1'

# pagination
gem 'kaminari', '~> 1.1', '>= 1.1.1'

# help with styling
gem 'bootstrap', '~> 4.4', '>= 4.4.1'

# alerts
gem 'gritter', '~> 1.2'

# visualization library
gem 'chartkick', '~> 3.3', '>= 3.3.1'

gem 'jquery-rails'

gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'

ruby "2.5.8"

gem 'sprockets', '~>3.7.2'

gem 'rubyzip', '~> 2.3'

gem 'ffi', '~> 1.12', '>= 1.12.2'

gem 'rake', '~> 13.0', '>= 13.0.1'

gem 'actionview', '~> 6.0', '>= 6.0.2.2'

gem 'nokogiri', '~> 1.11.4'

gem 'activejob', '~> 6.0', '>= 6.0.2.2'

gem 'rails-html-sanitizer', '~> 1.3'

gem 'loofah', '~> 2.5'