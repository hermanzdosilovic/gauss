require 'commands/parsers/set_parser'

module Gauss
  module Set
    def self.run(args = [])
      begin
        arguments = SetParser.parse(args)
      rescue
        puts SetParser.usage
        return
      end

      puts arguments
    end
  end
end
