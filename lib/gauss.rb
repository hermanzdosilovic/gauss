require "gauss/version"
require "gauss_command"
require "pry"

module Gauss
  def self.run(args)
   begin
     GaussCommand.send args[0], args[1..-1]
   rescue
     GaussCommand.help
     puts
     puts $!
     puts $@
     binding.pry
   end
  end
end
