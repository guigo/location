require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Location
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.encoding = "utf-8"
    config.i18n.default_locale = :"pt-BR"

    config.assets.initialize_on_precompile = false

    config.to_prepare do
      # Set Devise Mailer layout
      Devise::Mailer.layout 'mailer'
    end
  end
end
