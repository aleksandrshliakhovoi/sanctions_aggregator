require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module SanctionsAggregator
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.action_mailer.smtp_settings = {
      :address => ENV.fetch('SMTP_HOST'),
      :port => ENV.fetch('SMTP_PORT'),
      :user_name => ENV.fetch('SMTP_USER'),
      :password => ENV.fetch('SMTP_PASSWORD'),
      :authentication => :plain,
      :enable_starttls_auto => ENV.fetch('SMTP_STARTTLS')
    }
  end
end
