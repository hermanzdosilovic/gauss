require 'pry'

require 'commands/help'
require 'commands/info'
require 'commands/init'
require 'commands/set'

module Gauss
  GAUSS_KEY = ENV['HOME'] + '/.gauss.key'
  GAUSS_CONF = '.gauss'
  GAUSS_GLOBAL_CONF = ENV['HOME'] + '/' + GAUSS_CONF

  BASE_URL = 'https://productive.io/api/v1'

  def self.run(args)
    Object.const_get('Gauss::' + classify(args[0])).run args[1..-1]
  end

  private

  def self.classify(string)
    string[0].upcase + string[1..-1].downcase
  end
end
