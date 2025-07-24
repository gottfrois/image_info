lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_info/version'

Gem::Specification.new do |spec|
  spec.name          = 'image_info'
  spec.version       = ImageInfo::VERSION
  spec.authors       = ['Pierre-Louis Gottfrois']
  spec.email         = ['pierrelouis.gottfrois@gmail.com']

  spec.summary       = 'ImageInfo finds the size and type of a single or ' \
                       'multiple images from the web by fetching as little as ' \
                       'needed.'
  spec.description   = 'ImageInfo finds the size and type of a single or ' \
                       'multiple images from the web by fetching as little as ' \
                       'needed.'
  spec.homepage      = 'https://github.com/gottfrois/image_info'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'addressable'
  spec.add_dependency 'image_size'
  spec.add_dependency 'typhoeus'
  spec.add_dependency 'logger'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'webmock'
end
