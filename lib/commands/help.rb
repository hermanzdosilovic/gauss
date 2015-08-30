module Gauss
  module Help
    def self.run(args_ignorable = [])
      puts 'usage: gauss <command> [<args>]'
      puts "    help\tShow this message"
      puts "    info\tGet info about current organization, project, service or task"
      puts "    init\tInitialize gauss with your Productive.io API key"
      puts "    set \tSet organization, project, service or task"
    end
  end
end
