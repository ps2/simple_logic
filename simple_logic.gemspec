# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_logic/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_logic"
  spec.version       = SimpleLogic::VERSION
  spec.authors       = ["Pete Schwamb"]
  spec.email         = ["pete@schwamb.net"]
  spec.description   = %q{Boolean logic parsing and evaluation engine}
  spec.summary       = %q{A ruby gem that parses and evaluates simple boolean statements specified as a string.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"

  spec.add_dependency("treetop")
end
