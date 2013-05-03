# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datastore/version'

Gem::Specification.new do |spec|
  spec.name          = "datastore"
  spec.version       = Datastore::VERSION
  spec.license       = "MIT"

  spec.authors       = ["Nat Welch"]
  spec.email         = ["nat@natwelch.com"]

  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{A gem for interacting with the Google Cloud Datastore.}
  spec.homepage      = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency('google-api-client', '>= 0.6.2')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
