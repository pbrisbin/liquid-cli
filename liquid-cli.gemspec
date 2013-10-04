# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liquid/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "liquid-cli"
  spec.version       = Liquid::Cli::VERSION
  spec.authors       = ["patrick brisbin"]
  spec.email         = ["pbrisbin@gmail.com"]
  spec.description   = %q{Command line interface to the Liquid gem by Shopify}
  spec.summary       = %q{Render liquid templates on the command line.}
  spec.homepage      = "https://github.com/pbrisbin/liquid-cli"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'liquid'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
