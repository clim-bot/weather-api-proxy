source "https://rubygems.org"

# Specify your Ruby version
ruby "3.1.2"

# Rails
gem "rails", "~> 7.2.1"

# Use PostgreSQL as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"

# Use Puma as the app server
gem "puma", "~> 5.0"

# Use SCSS for stylesheets (if you're doing frontend work, but you can remove this for API-only apps)
gem "sassc-rails"

# Use Uglifier as compressor for JavaScript assets (if you have frontend assets)
gem "uglifier"

# HTTP requests to external APIs (OpenWeatherMap)
gem "httparty"

# Redis for caching
gem "redis"

# Dotenv for environment variable management
gem "dotenv-rails"

# For JSON parsing and handling
gem "oj"

# For secure password management
gem "bcrypt", "~> 3.1.7"

# Testing and development gems
group :development, :test do
  # RSpec for testing
  gem "rspec-rails", "~> 7.0"

  # Pry for better debugging
  gem "pry"
end

group :test do
  # WebMock for stubbing HTTP requests in tests
  gem "webmock", "~> 3.13"

  # FactoryBot for creating test data
  gem "factory_bot_rails"

  # Shoulda Matchers for simpler tests
  gem "shoulda-matchers"

  # Capybara for integration tests
  gem "capybara"

  # Database cleaner to reset database state between tests
  gem "database_cleaner-active_record"

  # To track test coverage
  gem "simplecov", require: false
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', path: 'path/to/your/rails'

# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Use Redis adapter to run ActionCable in production
# gem 'redis', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem "bootsnap", require: false
