require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

module UtopiaDataIntegrationSpecHelper
  def load_defaults!
    UtopiaData.load!
    UtopiaData.register(:lei)
  end

  def load_resources
    yield
    reload_routes!
  end

  def reload_routes!
    Rails.application.reload_routes!
  end

  def run_migrations!
    system "cd spec/dummy && RAILS_ENV=test bundle exec rake db:migrate"
  end
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

include UtopiaDataIntegrationSpecHelper
load_defaults!
reload_routes!
run_migrations!

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
end
