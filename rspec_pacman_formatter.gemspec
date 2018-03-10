# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_pacman_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec_pacman_formatter'
  spec.version       = RspecPacmanFormatter::VERSION
  spec.authors       = ['Carlos Luis Rojas Aragonés']
  spec.email         = ['crojas@go-labs.net']

  spec.summary       = 'Pacman Formatter for rspec.'
  spec.description   = 'Pacman Formatter for rspec.'
  spec.homepage      = 'https://github.com/go-labs/rspec_pacman_formatter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec'
  spec.add_dependency 'colorize'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
