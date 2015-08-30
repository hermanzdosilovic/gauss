require 'pry'

require 'commands/clock'
require 'commands/help'
require 'commands/info'
require 'commands/init'
require 'commands/set'

require 'config'

module Gauss
  GAUSS_KEY = ENV['HOME'] + '/.gauss.key'
  GAUSS_CONF = '.gauss'
  GAUSS_LOCAL_CONF = `git rev-parse --show-toplevel 2> /dev/null`.strip + '/' + GAUSS_CONF
  GAUSS_GLOBAL_CONF = ENV['HOME'] + '/' + GAUSS_CONF

  BASE_URL = 'https://productive.io/api/v1'

  def self.run(args)
    Object.const_get('Gauss::' + classify(args[0])).run args[1..-1]
  rescue
    puts $!
    puts $@
    puts "gauss: '#{args[0]}' is not a gauss command. See 'gauss help'."
  end

  private

  def self.classify(string)
    string[0].upcase + string[1..-1].downcase
  end
end
