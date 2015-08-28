module Gauss
  module Help
    def self.help(args_ignorable = [])
      puts 'usage: gauss <command> [<args>]'
      puts "    init\tInitialize gauss with your Productive.io API key"
      puts "    help\tShow this message"
    end
  end
end
