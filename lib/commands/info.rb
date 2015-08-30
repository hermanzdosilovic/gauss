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

      if attributes.empty?
        attributes[:organization] = nil
        attributes[:project] = nil
        attributes[:task] = nil
        attributes[:service] = nil
      end

      message = ''
      attributes.keys.each do |key|
        message << "#{key.upcase}: #{ENV[key.upcase.to_s] || 'N/A'}\n"
      end
      print message
    end
  end
end
