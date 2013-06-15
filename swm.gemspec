# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'swm/version'

Gem::Specification.new do |spec|
  spec.name          = "swm"
  spec.version       = Swm::VERSION
  spec.authors       = ["Lasse Skindstad Ebert"]
  spec.email         = ["lasseebert@gmail.com"]
  spec.description   = %q{
    Simple Window Manager is a utillity to move and place windows in Ubuntu.
    It might work with other *nix distributions.

    The utillity is intended to be used with keyboard shortcuts, and is
    always operating on the active window.
  }
  spec.summary       = %q{Simple Window Manager for Ubuntu}
  spec.homepage      = "https://github.com/lasseebert/swm"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
