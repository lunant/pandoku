require File.dirname(__FILE__) + '/pandoku/document'
require File.dirname(__FILE__) + '/pandoku/format'

# %w<markdown rst html latex
# context man mediawiki texinfo docbook opendocument odt s5 rtf>.each do |f|
%w<markdown rst html latex context man odt rtf>.each do |f|
  require "#{File.dirname(__FILE__)}/pandoku/formats/#{f}"
end

