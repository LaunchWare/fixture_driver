require 'spec_helper'
require 'capybara/rspec'

describe FixtureDriver::Capybara, type: :request do
  include FixtureDriver::Capybara

  let(:mock_fixture) do
    mock.tap do |m|
      m.stubs(:save)
    end
  end

  class TestApp
    def call(env)
      [200, {'Content-Type' => 'text/html'}, [body]]
    end

    def body
      %q{<html>
        <head></head>
        <body>
            <p>Hello World!</p>
          <script class="third_party_script" src="http://www.google.com"></script>
        </body>
         </html>
      }
    end
  end

  def self.app
    TestApp.new
  end

  Capybara.app = app

  let(:path) { File.join(File.dirname(__FILE__), 'fixture_container', 'fixture.html' ) }

  it 'attempts to init and save a fixture' do
    FixtureDriver::Fixture.expects(:new).returns(mock_fixture)

    save_fixture(path)

    mock_fixture.should have_received(:save)
  end

  require 'pry'
  it 'saves a fixture based on the last visited document' do
    visit "/"
    save_fixture(path)
    File.read(path).should include('Hello World!')
  end
end

