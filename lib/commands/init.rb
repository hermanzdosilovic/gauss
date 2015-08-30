require 'httparty'
require 'io/console'

require 'commands/parsers/init_parser'

module Gauss
  module Init
    AUTHENTICATION_SESSION = '/users/login'

    def self.run(args = [])
      flags = InitParser.parse(args)

      print 'username: '
      username = STDIN.gets.chomp

      print 'password: '
      password = STDIN.noecho(&:gets).chomp
      puts

      params = { query: { username: username, password: password } }
      response = HTTParty.post(BASE_URL + AUTHENTICATION_SESSION, params)

      if response.code != 200
        puts "Invalid username or password."
        return
      end

      puts "Authentication successfull"
      attributes = {productive_api_key: response['response']['token']}

      if flags[:local]
        Config.update(GAUSS_LOCAL_CONF, attributes)
      else
        Config.update(GAUSS_GLOBAL_CONF, attributes)
      end
    rescue Interrupt
      puts
    rescue
      puts InitParser.usage
    end
  end
end
