require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# Skip sprockets since we're building an API-only app
# require "sprockets/railtie"

Bundler.require(*Rails.groups)

module WeatherApiProxy
  class Application < Rails::Application
    config.load_defaults 7.0

    # Disable Sprockets and assets pipeline since it's an API-only app
    config.api_only = true
  end
end
