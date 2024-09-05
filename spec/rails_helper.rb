ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Abort if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'webmock/rspec'

# Disable external HTTP connections except for localhost (if you're using services like Selenium for tests)
WebMock.disable_net_connect!(allow_localhost: true)

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
# You can configure `config.include` in your tests by adding files to this directory.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Ensure migrations are run before the tests start
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or don't need ActiveRecord support
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Use transactional fixtures for ActiveRecord
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred automatically.
  config.infer_base_class_for_anonymous_controllers = false

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  # Arbitrarily load additional gems or libraries for RSpec
  config.before(:suite) do
    # Example of setting global mocks or stubs
    WebMock.disable_net_connect!(allow_localhost: true)
  end

  # You can limit a spec run to individual examples or groups.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # If you prefer the new `expect` syntax instead of `should`, include this:
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
end
