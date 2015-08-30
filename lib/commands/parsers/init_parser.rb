require 'optparse'

module Gauss
  module Init
    module InitParser
      @option_parser = OptionParser.new do |opts|
        @args = {}

        opts.banner = 'usage: gauss init [<args>]'

        opts.on('-l', '--local', 'Init local options') do |n|
          @args[:local] = n
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
