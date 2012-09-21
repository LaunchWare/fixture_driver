require 'rspec'

require 'bundler/setup'

require 'fixture_driver' # and any other gems you need

require 'mocha'
require 'bourne'

RSpec.configure do |config|
  config.mock_with :mocha
end

