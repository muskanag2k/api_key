source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7', '>= 6.1.7.8'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'paperclip'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '~> 0.13.0'
  gem 'pry-byebug', '~> 3.9.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'spring', '~> 2.0.2'
  gem 'mailsafe', '~> 0.3.1'
  gem 'pry-doc'
  gem 'rb-readline', '~> 0.5.5'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.9'
  gem 'bcrypt', '~>3.1.15'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rvm'
  gem 'web-console', '>= 3.3.0'
  gem 'meta_request'
  # gem 'listen'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :test do
  # gem 'factory_bot_rails'
  gem 'factory_bot', '!=6.4.5'
  gem 'database_cleaner-active_record'
  gem 'faker', '~> 2.2.1'
  gem 'email_spec', '~> 2.2.0'
  gem 'airborne', '~> 0.2.13'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'rails-controller-testing'
  gem 'simplecov', '~> 0.12.0'
  gem 'timecop',
    :git => "https://github.com/travisjeffery/timecop.git",
    :ref => "b794cf685ce0ca2d019300947455037debcb4d2c"
  gem 'rubocop-rspec'
  #https://github.com/chrisalley/pundit-matchers/issues/1
  gem 'pundit-matchers', '~> 1.6.0', require: false
  gem "json-schema"
end