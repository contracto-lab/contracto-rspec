# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "contracto/rspec/version"

Gem::Specification.new do |spec|
  spec.name          = "contracto-rspec"
  spec.version       = Contracto::Rspec::VERSION
  spec.authors       = ["Kacper Walanus"]
  spec.email         = ["kacper@walanus.com"]

  spec.summary       = %q{Contracto for RSpec}
  spec.description   = %q{Contracto for RSpec}
  spec.homepage      = "https://github.com/kv109/contracto-rspec"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "httparty", "~> 0.13"
  spec.add_runtime_dependency "contracto", "~> 0.4"

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
