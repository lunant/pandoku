require 'rubygems'
require 'rake/rdoctask'

task :doc => :rdoc

Rake::RDocTask.new :rdoc do |rdoc|
  rdoc.rdoc_dir = "doc/html"
  rdoc.title = "Pandoku: Loose Ruby interface for Pandoc, " \
               "the most powerful markup processor."
  rdoc.options << "--inline-source" <<
                  "--title" << rdoc.title <<
                  "--charset" << "UTF-8" <<
                  "--main" << "Pandoku"
  rdoc.rdoc_files.include('lib/pandoku.rb', 'lib/pandoku/*.rb',
                          'lib/pandoku/formats/*.rb')
end

