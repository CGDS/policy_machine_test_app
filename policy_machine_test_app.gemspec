# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'policy_machine_test_app/version'

Gem::Specification.new do |spec|
  spec.name          = "policy_machine_test_app"
  spec.version       = PolicyMachineTestApp::VERSION
  spec.authors       = ["Matthew Szenher", 'Aaron Zinger']
  spec.email            = spec.authors.map{|name|name.sub(/(.).* (.*)/,'\1\2@mdsol.com')}

  spec.summary       = %q{some summary}
  spec.description   = %q{some description}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency('rails', '4.2')
  spec.add_dependency('pg')
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
