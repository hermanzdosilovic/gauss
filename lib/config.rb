require 'dotenv'

module Gauss
  module Config
    def self.update(file, attributes)
      # read current config attributes
      file_attributes = Dotenv.load(file)

      # update current config attributes with new attributes
      attributes.each do |key, value|
        file_attributes[key.upcase.to_s] = value
      end

      # write attributes to config file
      config_file = File.open(file, 'w')
      file_attributes.each do |key, value|
        config_file.puts key + "=" + value
      end
      config_file.close

      # update current env variables
      Env.update(file_attributes)
    end
  end
end
