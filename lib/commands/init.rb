require 'httparty'
require 'io/console'

require 'commands/parsers/init_parser'

module Gauss
  module Init
    AUTHENTICATION_SESSION = '/users/login'

    def self.run(args = [])
      begin
        arguments = InitParser.parse(args)
      rescue
        puts InitParser.usage
        return
      end

      if arguments.any?
        puts arguments
      else
        init_gauss_key
      end
    end

    private

    def self.init_gauss_key
      begin
        print 'username: '
        username = STDIN.gets.chomp

        print 'password: '
        password = STDIN.noecho(&:gets).chomp

        params = { query: { username: username, password: password } }
        response = HTTParty.post(BASE_URL + AUTHENTICATION_SESSION, params)

        if response.code != 200
          puts "\nInvalid username or password."
          return
        end

        puts "\nAuthentication successfull"
        gauss_conf_file = File.open(GAUSS_KEY, 'w')
        gauss_conf_file.puts("PRODUCTIVE_API_KEY=#{response['response']['token']}")
        gauss_conf_file.close
      rescue Interrupt
        puts
      end
    end
  end
end
