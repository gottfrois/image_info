# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_info/version'

Gem::Specification.new do |spec|
  spec.name          = "image_info"
  spec.version       = ImageInfo::VERSION
  spec.authors       = ["Pierre-Louis Gottfrois"]
  spec.email         = ["pierrelouis.gottfrois@gmail.com"]

  spec.summary       = %q{ImageInfo finds the size and type of a single or multiple images from the web by fetching as little as needed.}
  spec.description   = %q{ImageInfo finds the size and type of a single or multiple images from the web by fetching as little as needed.}
  spec.homepage      = "https://github.com/gottfrois/image_info"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "typhoeus", "~> 1.0"
  spec.add_dependency "image_size", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
