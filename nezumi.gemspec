# -*- encoding: utf-8 -*-
require File.expand_path('../lib/nezumi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marshall Huss"]
  gem.email         = ["mwhuss@gmail.com"]
  gem.description   = %q{Gem to interact with the Nezumi Push Heroku add-on}
  gem.summary       = %q{Nezumi Push allows you to send iOS push notificatons from your Heroku app to members on your development team who use Nezumi}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "nezumi"
  gem.require_paths = ["lib"]
  gem.version       = Nezumi::VERSION
end
