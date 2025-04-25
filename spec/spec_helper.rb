require 'simplecov'
SimpleCov.start
require File.expand_path('../../lib/elmas', __FILE__)

require 'pry'
require 'rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.include WebMock::API
  config.before(:each) do
    Elmas.reset
  end
end
