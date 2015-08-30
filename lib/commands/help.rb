module Gauss
  module Help
    def self.run(args_ignorable = [])
      puts 'usage: gauss <command> [<args>]'
      puts "    help\tShow this message"
      puts "    info\tGet info about current organization, project or task"
      puts "    init\tLogin to Productive.io and get your API key"
      puts "    set \tSet organization, project or task"
      puts "    clock\tCopy git log messages to clipboard"
    end
  end
end
