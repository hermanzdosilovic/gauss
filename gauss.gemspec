# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = 'gauss'
  spec.version       = Gauss::VERSION
  spec.authors       = ['Herman Zvonimir Došilović']
  spec.email         = ['hermanz.dosilovic@gmail.com']

  spec.summary       = 'CLI for https://productive.io'
  spec.description   = 'CLI for https://productive.io'
  spec.homepage      = 'https://github.com/hermanzdosilovic/gauss'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']
  spec.bindir        = 'bin'
  spec.executables   = 'gauss'
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '4.2.4'
  spec.add_dependency 'httparty', '0.13.5'
  spec.add_dependency 'json', '1.8.3'
  spec.add_dependency 'dotenv', '~> 2.0'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'pry', '~> 0.10'
end
