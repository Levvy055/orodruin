# Coverage reports
require 'simplecov'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'

# Nicer output
require 'minitest/reporters'
MiniTest::Reporters.use!(MiniTest::Reporters::SpecReporter.new) unless ENV['CI']

# RR mocking library
require 'rr'

# Extra matchers
require 'minitest/extra/matchers'

DatabaseCleaner.strategy = :transaction

Dir['test/support/*'].each { |file| load file }

class MiniTest::Spec
  include Minitest::Extra::Matchers::Subject
  include Minitest::Extra::Matchers::Received
  include Minitest::Extra::Matchers::Pending
  include Minitest::Extra::Matchers::DOM

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
