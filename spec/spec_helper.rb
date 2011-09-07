ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rubygems'
require 'spork'
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  
  RSpec.configure do |config|
    # == Mock Framework
    config.mock_with :rspec

    config.before(:suite) do
      DatabaseCleaner[:mongoid].strategy = :truncation
    end

    config.before(:each) do
      DatabaseCleaner[:mongoid].start
    end

    config.after(:each) do
      DatabaseCleaner[:mongoid].clean
    end

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    #config.use_transactional_fixtures = true
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.  
end
