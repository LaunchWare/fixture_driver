# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fixture_driver/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Dan Pickett"]
  gem.email         = ["dan.pickett@launchware.com"]
  gem.description   = %q{A tool to propagate acceptance test html to client side specs}
  gem.summary       = %q{Use ruby integration tests to write html fixtures for you}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fixture_driver"
  gem.require_paths = ["lib"]
  gem.version       = FixtureDriver::VERSION

  gem.add_dependency 'capybara'
  gem.add_dependency 'nokogiri'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'bourne'
end

