$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "mlo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mlo"
  s.version     = Mlo::VERSION
  s.authors     = ["“shravanc”"]
  s.email       = ["shravan007.c@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of Mlo."
  s.description = "Description of Mlo."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.0"

  s.add_development_dependency "sqlite3"

	s.add_development_dependency 'rspec-rails'
	s.add_development_dependency 'capybara'
	s.add_development_dependency 'factory_girl_rails'

	s.test_files = Dir["spec/**/*"]

end
