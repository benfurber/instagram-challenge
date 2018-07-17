require 'simplecov'
require 'simplecov-console'

SimpleCov.start 'rails'

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'support/factory_bot'
require 'support/views_helper'
require 'support/login_helper'
require 'database_cleaner'
require 'devise'

Rails.application.eager_load!

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])

DatabaseCleaner.strategy = :truncation

ActiveRecord::Migration.maintain_test_schema!

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.before do
    DatabaseCleaner.clean
  end

  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Devise::Test::IntegrationHelpers, :type => :request

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end
