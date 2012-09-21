module FixtureDriver
  class Fixture
    def initialize(html, path)
      @path = path
      @node = Nokogiri::HTML(html)
    end

    def save
      FileUtils.mkdir_p(File.dirname(@path))
      remove_third_party_scripts
      File.open(@path, 'wb') do |file|
        file << divify(@node.css('body'))
      end
      true
    end

    private
    def remove_third_party_scripts
      @node.css('.third-party-script').remove
  end

    def divify(body_node)
      body_node.to_s.gsub('<body', '<div').gsub('</body>', '</div>')
    end
  end
end

