$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "ketsuban/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "ketsuban"
  spec.version     = Ketsuban::VERSION
  spec.authors     = ["oieioi"]
  spec.email       = ["atsuinatsu.samuifuyu@gmail.com"]
  spec.homepage    = "https://github.com/oieioi/ketsuban"
  spec.summary     = "🍀 Skip unlucky numbers for ActiveRecord surrogate key"
  spec.description = "🍀 Skip unlucky numbers for ActiveRecord surrogate key"
  spec.license     = "MIT"
  spec.required_ruby_version = '~> 2.5'

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.0"

  spec.add_development_dependency "database_cleaner"
  spec.add_development_dependency "minitest-around"
  spec.add_development_dependency "mysql2"
  spec.add_development_dependency "pg"
  spec.add_development_dependency "rubocop"
end
