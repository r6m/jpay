# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jpay/version'

Gem::Specification.new do |spec|
  spec.name          = "jpay"
  spec.version       = Jpay::VERSION
  spec.authors       = ["Reza Morsali"]
  spec.email         = ["light.reza@gmail.com"]
  spec.summary       = %q{JahanPay payment gateway gem for rails}
  spec.description   = %q{the Jpay gem provides Ruby APIs for proccessing payments, transactions and verifications using JahanPay's Merchant APIs. For more information please visit JahanPay website}
  spec.homepage      = "https://github.com/rezam90/jpay"
  spec.license       = "MIT"
  # spec.required_ruby_version = '~> 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "savon", '~> 2.11', '>= 2.11.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", ">= 12.3.3"
end
