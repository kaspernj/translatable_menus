$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "translatable_menus/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "translatable_menus"
  s.version     = TranslatableMenus::VERSION
  s.authors     = ["Kasper Johansen"]
  s.email       = ["k@spernj.org"]
  s.homepage    = "https://www.github.com/kaspernj/translatable_menus"
  s.summary     = "Translatable menus in Rails"
  s.description = "Easy to set up translatable menus in Rails with ActiveAdmin, Devise, Globalize and a couple of friends, that does everything but the actual rendering."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "globalize", ">= 4.0.0"
  s.add_dependency "devise"
  s.add_dependency "string-cases"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "forgery"
end
