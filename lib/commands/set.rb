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

      global = attributes[:global]
      attributes.delete(:global)

      premissions = Premissions.new(attributes)
      if premissions.invalid?
        puts premissions.errors
        return
      end

      if global
        Config.update(GAUSS_GLOBAL_CONF, attributes)
      else
        Config.update(GAUSS_LOCAL_CONF, attributes)
      end
    end
  end
end
