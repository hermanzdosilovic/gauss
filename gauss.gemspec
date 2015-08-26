# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gauss/version'

Gem::Specification.new do |spec|
  spec.name          = "gauss"
  spec.version       = Gauss::VERSION
  spec.authors       = ["Herman Zvonimir Došilović"]
  spec.email         = ["hermanz.dosilovic@gmail.com"]

  spec.summary       = %q{CLI for https://productive.io}
  spec.description   = %q{CLI for https://productive.io}
  spec.homepage      = "https://github.com/hermanzdosilovic/gauss"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  # spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files         = Dir["lib/**/*"]
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = "gauss"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
