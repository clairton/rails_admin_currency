$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_currency/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_currency"
  s.version     = RailsAdminCurrency::VERSION
  s.authors     = ["Clairton Rodrigo Heinzen"]
  s.email       = ["clairton.rodrigo@gmail.com"]
  s.homepage    = "http://github.com/clairton"
  s.summary     = "Currency type por rails_admin."
  s.description = "Show and digit a currency values."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "rails_admin", ">= 0.6.2"
  s.add_dependency 'maskedinput-rails', '>= 1.3.1.0'
  s.add_dependency 'maskmoney-rails', '>= 3.0.2.0'
end
