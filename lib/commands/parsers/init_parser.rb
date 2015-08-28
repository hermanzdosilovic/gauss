require 'optparse'
require 'pry'

module Gauss
  module Init
    module InitParser
      @option_parser = OptionParser.new do |opts|
        @args = {}

        opts.banner = 'usage: gauss init [<args>]'

        opts.on('-tTASK', '--task=TASK', 'Initalize task for current project') do |n|
          @args[:task] = n
        end

        opts.on('-sSERVICE', '--service=SERVICE', 'Initalize clocking service') do |n|
          @args[:service] = n
        end

        opts.on('-pPROJECT', '--project=PROJECT', 'Initalize project') do |n|
          @args[:project] = n
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
