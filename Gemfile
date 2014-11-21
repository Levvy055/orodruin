source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.beta4'

gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# API builder
gem 'grape', '~> 0.9.0'
# Build JSON APIs with ease.
gem 'grape-entity'

# Use jquery as the JavaScript library
# gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Spring speeds up development by keeping your application running in the
# background. Read more: https://github.com/rails/spring
gem 'spring', group: :development

# Use Unicorn as the app server
gem 'unicorn', require: false

# Background jobs
gem 'sidekiq'

# Photos uploader
gem 'carrierwave'
gem 'mini_magick'

# User management
gem 'devise', '~> 3.4.0'
gem 'cancancan', '~> 1.9.0'
gem 'rolify', '~> 3.4.0'

# OAuth sign up
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-google-oauth2'
gem 'omniauth-vkontakte'

# Simplify controllers by decent_exposure
gem 'decent_exposure'

# Simplify views using decorators
gem 'draper', '~> 1.4.0'

# Nicer views template engine
gem 'slim-rails'

# From helpers
gem 'simple_form', '~> 3.0.1'

# Lightweight markup language for blog posts (Markdown in this case)
gem 'redcarpet', '~> 3.1.0'
gem 'emoji'

# Faster HTML escaping
gem 'escape_utils'

# Allow social translations
gem 'localeapp'
gem 'r18n-rails'

# Tracking
gem 'ahoy_matey'
gem 'ahoy_email'

# Inline email CSS
gem 'roadie', '~> 3.0.1'
gem 'roadie-rails'

# Better logging
gem 'lograge'

gem 'audited'

group :doc do
  gem 'yard', require: false
  gem 'yard-tomdoc', require: false
end

group :development do
  gem 'web-console', '~> 2.0.beta4'

  # Process management
  gem 'foreman', require: false

  # Style checking
  gem 'rubocop', require: false

  # Detect N+1 queries
  gem 'bullet'

  # Detect security vulnerabilities
  gem 'brakeman', require: false

  # Preview application flow in Chrome
  gem 'meta_request'

  # Create model annotations
  gem 'annotate', '~> 2.6.5'

  # STFU
  gem 'quiet_assets'

  # Automate things
  gem 'guard', '~> 2.8.2'
  gem 'guard-minitest'
  gem 'guard-konacha'
end

group :development, :test do
  # Acceptance tests
  gem 'spinach-rails'

  # Better console
  gem 'pry-rails'
  gem 'pry-byebug'

  # Fixtures replacement
  gem 'fabrication'
  gem 'ffaker'
end

group :test do
  # Use MiniTest::Spec instead of MiniTest::Unit
  gem 'minitest-rails'
  gem 'minitest-extra-matchers'
  gem 'minitest-reporters'
  gem 'minitest-metadata', require: false
  gem 'minitest-capybara'

  # Nicer mocking library
  gem 'rr', require: false

  gem 'poltergeist'

  # Coverage reports
  gem 'simplecov', require: false
  gem 'coveralls', require: false

  # JavaScript test runner
  gem 'konacha'

  gem 'database_cleaner'
end
