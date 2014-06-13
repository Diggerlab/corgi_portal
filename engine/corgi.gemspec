$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "corgi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "corgi"
  s.version     = Corgi::VERSION
  s.authors     = ["daneil"]
  s.email       = ["daneilmu1@gmail.com"]
  s.homepage    = "https://rubygems.org/profiles/daneil"
  s.summary     = "corgi"
  s.description = "Description of corgi."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.test_files = Dir["spec/**/*"]
  s.require_paths = ["lib"]
end
