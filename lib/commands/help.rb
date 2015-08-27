module Gauss
  module GaussCommand
    module Help
      def help(args_ignorable = [])
        puts "usage: gauss <command> [arguments]"
        puts
        puts "  commands:"
        puts "    init      Initialize gauss with your Productive.io API key"
        puts "    help      Show this help message"
      end
    end
  end
end
