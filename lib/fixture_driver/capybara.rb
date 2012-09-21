module FixtureDriver
  module Capybara
    def save_fixture(path)
      FixtureDriver::Fixture.new(page.body, path).save
    end
  end
end
