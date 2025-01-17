require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Orodruin
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_record.schema_format = :sql

    config.exceptions_app = self.routes

    config.assets.precompile += %w(
      admin/application.js
      admin/templates/all.js
      admin/application.css
    )
    config.assets.initialize_on_precompile = false
    config.ember.app_name = 'Admin'
    config.ember.ember_path = 'app/assets/javascripts/admin/'
    config.handlebars.templates_root = 'admin/templates'

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    config.active_record.raise_in_transactional_callbacks = true

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # config.i18n.default_locale = :pl

    config.lograge.enabled = true

    config.action_mailer.default_url_options = {
      host: 'https://orodruin.io'
    }

    config.generators do |g|
      g.test_framework      :minitest, fixture_replacement: :fabrication, spec: true
      g.fixture_replacement :fabrication, dir: 'test/fabricators'

      g.helper              false
      g.stylesheets         false
      g.javascripts         false
    end
  end
end
