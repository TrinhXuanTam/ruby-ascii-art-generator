# frozen_string_literal: true

require File.expand_path('lib/ascii_gen/version', __dir__)

Gem::Specification.new do |s|
  s.name        = 'AsciiGen'
  s.version     =  AsciiGen::VERSION
  s.homepage    = 'https://gitlab.fit.cvut.cz/NI-RUB/B221/trinhxu2/-/tree/master'
  s.license     = 'MIT'
  s.author      = 'Xuan Tam Trinh'
  s.email       = 'trinhxu2@fit.cvut.cz'

  s.summary     = 'Ascii art generator utility.'
  s.description = 'Utility loads an image, transforms the image into an ASCII art and optionally applies filters.'

  s.files       = Dir['bin/*', 'lib/**/*', '*.gemspec', 'LICENSE*', 'README*']
  s.executables = Dir['bin/*'].map { |f| File.basename(f) }

  s.required_ruby_version = '>= 2.6'

  s.add_runtime_dependency 'codecov', '~> 0.6.0'
  s.add_runtime_dependency 'mini_magick', '~> 4.11.0'
  s.add_runtime_dependency 'rspec', '~> 3.12.0'
  s.add_runtime_dependency 'thor', '~> 1.2.0'
end
