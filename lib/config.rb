require 'dotenv'

module Gauss
  module Config
    def self.update(file, attributes)
      file_attributes = Dotenv.load(file)
      attributes.each do |key, value|
        file_attributes[key.upcase.to_s] = value
      end

      config_file = File.open(file, 'w')
      file_attributes.each do |key, value|
        config_file.puts key + "=" + value
      end
      config_file.close

      Env.update(file_attributes)
    end
  end
end
