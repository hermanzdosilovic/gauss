require 'optparse'

module Gauss
  module Set
    module SetParser
      @option_parser = OptionParser.new do |opts|
        @args = {}

        opts.banner = 'usage: gauss set [<args>]'

        opts.on('-oORGANIZATION', '--organization=ORGANIZATION', 'Set organization') do |n|
          @args[:organization] = n
        end

        opts.on('-pPROJECT', '--project=PROJECT', 'Set project') do |n|
          @args[:project] = n
        end

        opts.on('-sSERVICE', '--service=SERVICE', 'Set clocking service') do |n|
          @args[:service] = n
        end

        opts.on('-tTASK', '--task=TASK', 'Set task for current project') do |n|
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
