require 'simplecov'
require 'simplecov-console'

SimpleCov.start 'rails'

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'devise'
require 'support/controller_helpers'
require 'support/factory_bot'
require 'support/views_helper'
require 'database_cleaner'

Rails.application.eager_load!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])

DatabaseCleaner.strategy = :truncation

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.before do
    DatabaseCleaner.clean
  end

  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Devise::Test::IntegrationHelpers, :type => :request

  config.include ControllerHelpers, :type => :controller

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

end
