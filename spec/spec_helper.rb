require 'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'
require 'database_cleaner'
require 'rspec'
require 'rack/test'
require 'vcr'
require_relative '../app/flickrr'

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov

module RSpecMixin
  include Rack::Test::Methods
  def app() Flickrr end
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :fakeweb
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RSpecMixin

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
