$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "utopia_data/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "utopia_data"
  s.version     = UtopiaData::VERSION
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.authors     = ["Duke"]
  s.email       = ["duke@vertigem.xxx"]
  s.homepage    = "http://utopia.vertigem.xxx"
  s.summary     = "Gem to open data."
  s.description = "Gem to open data."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["COPYING", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "inherited_resources", "~> 1.3.0"
  s.add_dependency "roar-rails", "~> 0.0.6"
end
