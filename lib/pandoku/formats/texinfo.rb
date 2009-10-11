require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # GNU Texinfo format. http://www.gnu.org/software/texinfo/
  #
  # == Available Options
  #
  # <tt>:toc</tt>:: Include an instruction to create table of contents.
  class Texinfo < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :texinfo
    end

    def self.default_options
      { :toc => false }
    end
  end
end
