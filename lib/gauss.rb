require 'version'
require 'gauss_command'
require 'pry'

module Gauss
  GAUSS_KEY = ENV['HOME'] + '/.gauss.key'
  GAUSS_CONF = '.gauss'
  GAUSS_GLOBAL_CONF = ENV['HOME'] + '/' + GAUSS_CONF

  def self.run(args)
   begin
     GaussCommand.send args[0], args[1..-1]
   rescue
     GaussCommand.help
     # only for development
     # puts
     puts $!
     # puts $@
     # binding.pry
   end
  end
end
