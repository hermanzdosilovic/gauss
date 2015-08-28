require 'pry'
require 'active_support/inflector'

require 'commands/help'
require 'commands/init'
require 'commands/set'

module Gauss
  GAUSS_KEY = ENV['HOME'] + '/.gauss.key'
  GAUSS_CONF = '.gauss'
  GAUSS_GLOBAL_CONF = ENV['HOME'] + '/' + GAUSS_CONF

  BASE_URL = 'https://productive.io/api/v1'

  def self.run(args)
    command = args[0]
    arguments = args[1..-1]
    Object.const_get('Gauss::' + command.classify).run arguments
  end
end
