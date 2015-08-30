require 'httparty'
require 'io/console'

module Gauss
  module Init
    AUTHENTICATION_SESSION = '/users/login'

    def self.run(args_ignorable = [])
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
      gauss_key_file = File.open(GAUSS_KEY, 'w')
      gauss_key_file.puts("PRODUCTIVE_API_KEY=#{response['response']['token']}")
      gauss_key_file.close
    rescue Interrupt
      puts
    end
  end
end
