$:.push File.expand_path("lib", __dir__)

# Maintain your 	s.s.add_development_dependency's version:
require "mlo/version"

# Describe your 	s.s.add_development_dependency and declare its dependencies:
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

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"

	s.add_development_dependency 'rspec-rails'
	s.add_development_dependency 'capybara'
	s.add_development_dependency 'factory_girl_rails'
	s.add_development_dependency 'pg'
	s.add_development_dependency 'paperclip'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'haml'



	s.add_development_dependency 'bootstrap', '~> 4.1.1'
  s.add_development_dependency 'coffee-rails', '4.2.2'
  s.add_development_dependency 'rails-timeago', '~> 2.0'  

  s.add_development_dependency 'jquery-fileupload-rails', '0.4.5'
#  s.add_development_dependency 'jquery-inputmask-rails', '~> 0.4.0'
  s.add_development_dependency 'jquery-knob-rails', '1.2.13'
  s.add_development_dependency 'jquery-rails', '4.3.1'
  s.add_development_dependency 'jquery-ui-rails', '5.0.5'
  s.add_development_dependency 'jquery-validation-rails', '1.16.0'
#  s.add_development_dependency 'blockuijs-rails' #, '~> 0.1.0', git: 'https://github.com/rusanu/blockuijs-rails.git'
  s.add_development_dependency 'client_side_validations', '9.3.4'
  s.add_development_dependency 'draper', '3.0.0'
  s.add_development_dependency 'fastclick-rails', '1.0.1'
  s.add_development_dependency 'liquid', '3.0.6'
  s.add_development_dependency 'redcarpet', '3.3.2'
  s.add_development_dependency 'sass', '3.5.5'
  s.add_development_dependency 'uglifier', '2.7.2'
  s.add_development_dependency 'underscore-rails', '1.8.3'
  s.add_development_dependency 'will_paginate', '3.1.6'


  s.test_files = Dir["spec/**/*"]

end
