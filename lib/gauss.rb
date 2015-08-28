require 'pry'

require 'commands/help'
require 'commands/init'

module Gauss
  GAUSS_KEY = ENV['HOME'] + '/.gauss.key'
  GAUSS_CONF = '.gauss'
  GAUSS_GLOBAL_CONF = ENV['HOME'] + '/' + GAUSS_CONF

  BASE_URL = 'https://productive.io/api/v1'

  def self.run(args)
    command = args[0]
    arguments = args[1..-1]

    case command
    when 'init' then Init.init arguments
    when 'help' then Help.help
    else Help.help
    end
  end
end
