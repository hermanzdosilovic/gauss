require 'clipboard'
require 'git'

module Gauss
  module Clock
    def self.run(args_ignorable = [])
      git = Git.open(`git rev-parse --show-toplevel 2> /dev/null`.strip)

      clock = ''
      git.log.since('1 day ago').each do |commit|
        clock << "* #{commit.message}\n"
      end

      if clock.empty?
        puts 'You do not have any commits from today.'
      else
        puts 'Your commits for today are now copied in clipboard:'
        puts clock
        Clipboard.copy clock
      end
    rescue
      puts 'gauss: Not a git repository (or any of the parent directories): .git'
    end
  end
end
