require 'clipboard'
require 'git'

module Gauss
  module Clock
    def self.run(args_ignorable = [])
      git = Git.open(`git rev-parse --show-toplevel`.strip)

      clock = ''
      git.log.since('1 day ago').each do |commit|
        clock << "* #{commit.message}\n"
      end

      Clipboard.copy clock
    end
  end
end
