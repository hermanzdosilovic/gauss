require 'config'
require 'env'
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

      Env.update(attributes)
      premissions = Premissions.new(attributes)

      if premissions.cannot_access_organization?
        puts 'You are not part of specified organization.'
        return
      elsif premissions.cannot_access_project?
        puts 'Project you are looking for does not exist in this organization.'
        return
      elsif premissions.cannot_access_task?
        puts 'Task you are looking for does not exist in this project.'
        return
      end

      Config.update(GAUSS_CONF, attributes)
    end
  end
end
