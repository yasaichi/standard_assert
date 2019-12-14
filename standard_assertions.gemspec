
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "standard_assertions/version"

Gem::Specification.new do |spec|
  spec.name          = "standard_assertions"
  spec.version       = StandardAssertions::VERSION
  spec.authors       = ["yasaichi"]
  spec.email         = ["yasaichi@users.noreply.github.com"]

  spec.summary       = %q{Standard Library-like library for assertions in Ruby}
  spec.description   = %Q{`standard_assertions` is a Standard Library-like library for assertions \
in Ruby. It is aimed at encouraging us to use assertion methods anywhere; Not only testing \
but also production.}
  p spec.description
  spec.homepage      = "https://github.com/yasaichi/standard_assertions"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "test-unit", ">= 3.0"
end
