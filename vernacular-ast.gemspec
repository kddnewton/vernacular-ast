# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vernacular/ast/version'

Gem::Specification.new do |spec|
  spec.name          = 'vernacular-ast'
  spec.version       = Vernacular::AST::VERSION
  spec.authors       = ['Kevin Deisz']
  spec.email         = ['kevin.deisz@gmail.com']

  spec.summary       = 'Extends Vernacular to support rewriting the AST'
  spec.homepage      = 'https://github.com/kddeisz/vernacular-ast'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'parser', '~> 2.4'
  spec.add_dependency 'racc', '~> 1.4'
  spec.add_dependency 'vernacular', '~> 0.0'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'minitest', '~> 5.10'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'
end
