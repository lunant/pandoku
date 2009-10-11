require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # OpenDocument XML format. http://www.gnu.org/software/texinfo/ 
  #
  # == Available Options
  #
  # <tt>:toc</tt>:: Include an instruction to create table of contents.
  class OpenDocument < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :opendocument
    end

    def self.default_options
      { :toc => false }
    end
  end
end
