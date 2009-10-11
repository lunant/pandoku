require 'rubygems'
require 'pathname'

Gem::Specification.new do |s|
  s.name = 'pandoku'
  s.version = '0.4'
  s.homepage = 'http://github.com/dahlia/pandoku'
  s.summary = s.description = 'Loose Ruby interface for Pandoc, ' \
                              'the most powerful markup processor.'
  s.author = 'Hong, MinHee'
  s.email = 'minh' 'ee@da' 'hlia.kr'

  s.files = Pathname.glob("lib/**/*").map(&:to_s)
  s.files << 'Rakefile'

  s.require_path = 'lib'

  s.has_rdoc = true
end

