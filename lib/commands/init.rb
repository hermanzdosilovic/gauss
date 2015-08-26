require "httparty"
require "io/console"
require "pry"

module GaussCommand
  module Init
    def init(args_ignorable = [])
      begin
        print 'username: '
        username = STDIN.gets.chomp

        print 'password: '
        password = STDIN.noecho(&:gets).chomp

        params = { query: { username: username, password: password } }
        response = HTTParty.post('https://productive.io/api/v1/users/login', params)

        if response["error"]
          puts "Invalid username or password.\n"
          return
        end

        puts "Authentication successfull"
        gauss_conf_file = File.open(File.expand_path('~/.gauss'), 'w')
        gauss_conf_file.puts("PRODUCTIVE_API_KEY=#{response['response']['token']}")
        gauss_conf_file.close
      rescue Interrupt
        puts
      end
    end
  end
end
