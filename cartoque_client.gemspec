# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cartoque_client/version'

Gem::Specification.new do |gem|
  gem.name          = "cartoque_client"
  gem.version       = CartoqueClient::VERSION
  gem.authors       = ["jbbarth"]
  gem.email         = ["jeanbaptiste.barth@gmail.com"]
  gem.description   = %q{API client for the Cartoque CMDB}
  gem.summary       = %q{API client for the Cartoque CMDB. See README or http://cartoque.org/ for more informations.}
  gem.homepage      = "http://cartoque.org/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
