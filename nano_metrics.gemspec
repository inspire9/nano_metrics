# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = 'nano_metrics'
  spec.version       = '0.0.1'
  spec.authors       = ['Pat Allan']
  spec.email         = ['pat@freelancing-gods.com']
  spec.summary       = %q{Simple metrics as a Rails Engine}
  spec.description   = %q{Track metrics within your Rails app.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'activerecord', '>= 3.2.0'
  spec.add_development_dependency 'combustion',   '~> 0.5.1'
  spec.add_development_dependency 'rspec-rails',  '~> 2.13'
  spec.add_development_dependency 'sqlite3',      '~> 1.3.7'
end
