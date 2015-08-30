require 'commands/parsers/info_parser'

module Gauss
  module Info
    def self.run(args = [])
      begin
        attributes = InfoParser.parse(args)
      rescue
        puts InfoParser.usage
        return
      end

      message = ''
      attributes.each do |key, value|
        message << "#{key.upcase}: #{ENV[key.upcase.to_s] || 'N/A'}\n"
      end
      print message
    end
  end
end
