require 'config'
require 'premissions'

require 'commands/parsers/set_parser'

module Gauss
  module Set
    def self.run(args = [])
      begin
        attributes = SetParser.parse(args)
      rescue
        puts SetParser.usage
        return
      end

      premissions = Premissions.new(attributes)
      if premissions.invalid?
        puts premissions.errors
        return
      end

      Config.update(GAUSS_CONF, attributes)
    end
  end
end
