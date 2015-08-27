require "commands/help"
require "commands/init"

module Gauss
  module GaussCommand
    BASE_URL = 'https://productive.io/api/v1'

    extend Help
    extend Init
  end
end
