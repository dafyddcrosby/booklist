# -*- encoding: utf-8 -*-
require File.expand_path('../lib/booklist/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "booklist"
  gem.authors       = ["Dafydd Crosby"]
  gem.description   = %q{A book collection program}
  gem.summary       = %q{Booklist helps you keep a list of books you've read or want to read.}

  gem.email         = "dafydd@dafyddcrosby.com"
  gem.homepage      = "https://github.com/dafyddcrosby/booklist"

  gem.license       = 'bsd' # The (three-clause) BSD License

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.version       = Booklist::VERSION
  gem.required_ruby_version = '>= 1.9'
  gem.add_dependency 'sqlite3'
  gem.add_dependency 'activerecord', '~> 4.0.0'
  gem.add_development_dependency 'rspec'
end
