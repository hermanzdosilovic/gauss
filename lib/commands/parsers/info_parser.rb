require 'optparse'

module Gauss
  module Info
    module InfoParser
      @option_parser = OptionParser.new do |opts|
        @args = {}

        opts.banner = 'usage: gauss info [<args>]'

        opts.on('-o', '--organization', 'Get current organization') do |n|
          @args[:organization] = n
        end

        opts.on('-p', '--project', 'Get current project of organization') do |n|
          @args[:project] = n
        end

        opts.on('-t', '--task', 'Get current task of project') do |n|
          @args[:task] = n
        end

        opts.on_tail('-h', '--help', 'Show this message') do
          puts opts
          exit
        end
      end

      def self.parse(options)
        @option_parser.parse!(options)
        @args
      end

      def self.usage
        @option_parser.to_s
      end
    end
  end
end
