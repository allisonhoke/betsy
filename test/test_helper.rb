ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'simplecov'
SimpleCov.start
Rails.application.eager_load!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  Minitest::Reporters.use!

  # Add more helper methods to be used by all tests here...
end
