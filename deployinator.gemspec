# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deployinator/version'

Gem::Specification.new do |gem|
  gem.name          = "deployinator"
  gem.version       = Deployinator::VERSION
  gem.authors       = ["JPaul"]
  gem.email         = ["jpaul@etsy.com"]
  gem.description   = %q{Deployinator as a Gem}
  gem.summary       = %q{Rewrite of deployinator to be a gem instead of repo to be forked}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end