# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'knights_travails/version'

Gem::Specification.new do |spec|
  spec.name          = "knights_travails"
  spec.version       = KnightsTravails::VERSION
  spec.authors       = ["Adler Santos"]
  spec.email         = ["adlersantos712@gmail.com"]
  spec.summary       = %q{Finds the shortest path for a knight in a chessboard.}
  spec.description   = %q{Shows the least number of moves needed for a chess knight to move from one position to another in a chessboard.}
  spec.homepage      = "https://github.com/adlersantos/knights_travails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
