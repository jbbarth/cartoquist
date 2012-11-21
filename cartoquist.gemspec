# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cartoquist/version'

Gem::Specification.new do |gem|
  gem.name          = "cartoquist"
  gem.version       = Cartoquist::VERSION
  gem.authors       = ["jbbarth"]
  gem.email         = ["jeanbaptiste.barth@gmail.com"]
  gem.description   = %q{API client for the Cartoque CMDB}
  gem.summary       = %q{API client for the Cartoque CMDB. See README or http://cartoque.org/ for more informations.}
  gem.homepage      = "http://cartoque.org/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "faraday", "~> 0.8"
  gem.add_dependency "faraday_middleware"
  gem.add_dependency "multi_json", '~> 1.3'
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", ">= 2.12.0"
  gem.add_development_dependency "webmock"
  gem.add_development_dependency "guard-rspec"
  gem.add_development_dependency "libnotify"
end
