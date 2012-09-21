require 'spec_helper'

describe FixtureDriver::Fixture do
  let(:path) { File.join(File.dirname(__FILE__), 'fixture_container', 'fixture.html' ) }
  let(:html) do
    %q{<html>
      <head></head>
      <body>
          <p>Hello World!</p>
        <script class="third_party_script" src="http://www.google.com"></script>
      </body>
       </html>
    }
  end

  let(:fixture) { FixtureDriver::Fixture.new(html, path) }

  it 'saves the fixture to the relevant path' do
    fixture.save.should be_true
    FileTest.exists?(path).should be_true
  end

  it 'saves the fixture with a div of the body contents' do
    fixture.save.should be_true
    contents = File.read(path)
    contents.should include('<div>')
    contents.should include('<p>Hello World!</p>')
    contents.should include('</div>')
  end

  it 'removes third party scripts' do
    fixture.save.should be_true
    contents = File.read(path)
    contents.should_not include('<script>')
  end
end

