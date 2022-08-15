require File.expand_path("lib/booklist/version", __dir__)

Gem::Specification.new do |gem|
  gem.name          = "booklist"
  gem.authors       = ["David Crosby"]
  gem.description   = "A book collection program"
  gem.summary       = "Booklist helps you keep a list of books you've read or want to read."

  gem.email         = "dave@dafyddcrosby.com"
  gem.homepage      = "https://github.com/dafyddcrosby/booklist"

  gem.license       = "bsd" # The (three-clause) BSD License

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.require_paths = ["lib"]
  gem.version       = Booklist::VERSION
  gem.required_ruby_version = ">= 1.9"
  gem.add_dependency "activerecord", "~> 4.0.0"
  gem.add_dependency "sqlite3"
  gem.add_development_dependency "rspec"
  gem.metadata["rubygems_mfa_required"] = "true"
end
