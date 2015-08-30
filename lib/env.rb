module Gauss
  module Env
    def self.update(attributes)
      attributes.each do |key, value|
        ENV[key.upcase.to_s] = value
      end
    end
  end
end
