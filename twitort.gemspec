# -*- encoding: utf-8 -*-
require File.expand_path('../lib/twitort/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mark Aaron Shirley"]
  gem.email         = ["markashirley@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "twitort"
  gem.require_paths = ["lib"]
  gem.version       = Twitort::VERSION

  gem.add_development_dependency 'rspec', '~> 2.10.0'
end
