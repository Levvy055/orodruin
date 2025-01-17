source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'
gem 'bootstrap-sass', '~> 3.3.4'
gem 'font-awesome-sass', '~> 4.3.0'
gem 'autoprefixer-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# API builder
gem 'active_model_serializers'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'ember-rails'
gem 'ember-source', '~> 1.13.0'

# Turbolinks makes following links in your web application faster.
# Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'pace-rails'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Bower assets
source 'https://rails-assets.org' do
  gem 'rails-assets-momentjs'
  gem 'rails-assets-js-md5'
end

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
gem 'sorcery'
gem 'rolify', '~> 4.1.0'
gem 'pundit'

# Nicer views template engine
gem 'curly-templates', '~> 2.3'

# Lightweight markup language for blog posts (Markdown in this case)
gem 'redcarpet', '~> 3.3.0'
gem 'emoji'

# Faster HTML escaping
gem 'escape_utils'

# Allow social translations
gem 'localeapp', group: [:production]
gem 'r18n-rails'

# Tracking
gem 'ahoy_matey'
gem 'ahoy_email'

# Inline email CSS
gem 'roadie', '~> 3.0.1'
gem 'roadie-rails'

# Better logging
gem 'lograge'
gem 'logstash-logger'

gem 'audited'
gem 'audited-activerecord', '~> 4.0'

group :doc do
  gem 'yard', require: false
  gem 'yard-tomdoc', require: false
end

group :development do
  gem 'pghero'

  gem 'web-console', '~> 2.0'

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

  # Profile application
  gem 'rack-mini-profiler'
  gem 'stackprof'
  gem 'flamegraph'
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
