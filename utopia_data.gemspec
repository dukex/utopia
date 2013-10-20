# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'utopia_data/version'

Gem::Specification.new do |spec|
  spec.name          = "utopia_data"
  spec.version       = UtopiaData::VERSION
  spec.authors       = ["Duke"]
  spec.email         = ["duke@riseup.net"]
  spec.description   = %q{UtopiaData is a (easy)way to expose/open database, with few commands UtopiaData
creates a RESTful API (with hypermedia) and read-only access to some
resources on database}
  spec.summary       = %q{UtopiaData is a (easy)way to expose/open database}
  spec.homepage      = "http://github.com/dukex/utopia"
  spec.license       = "GNU Affero General"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
  spec.add_dependency "grape", "~> 0.6.0"
  spec.add_dependency "thor"
  spec.add_dependency "roar"
  spec.add_dependency "activerecord", "~> 4.0.0"
end
