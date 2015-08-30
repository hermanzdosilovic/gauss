require 'optparse'

module Gauss
  module Set
    module SetParser
      @option_parser = OptionParser.new do |opts|
        @args = {}

        opts.banner = 'usage: gauss set <args>'

        opts.on('-oORGANIZATION', '--organization=ORGANIZATION', 'Set organization') do |n|
          @args[:organization] = n
        end

        opts.on('-pPROJECT', '--project=PROJECT', 'Set project for organization') do |n|
          @args[:project] = n
        end

        opts.on('-tTASK', '--task=TASK', 'Set task for project') do |n|
          @args[:task] = n
        end

        opts.on('-g', '--global', 'Set as global settings') do |n|
          @args[:global] = n
        end

        opts.on_tail('-h', '--help', 'Show this message') do
          puts opts
          exit
        end
      end

      def self.parse(options)
        @option_parser.parse!(options)
        raise if @args.empty?
        @args
      end

      def self.usage
        @option_parser.to_s
      end
    end
  end
end
