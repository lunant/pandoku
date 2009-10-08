require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # LaTeX format. http://www.latex-project.org/
  #
  # == Available Options
  #
  # <tt>:parse_raw</tt>:: Parse untranslatable LaTeX environments as raw LaTeX,
  #                       instead of ignoring them.
  # <tt>:number_sections</tt>:: Number section headings in LaTeX output.
  #                             (Default is not to number them.)
  # <tt>:no_wrap</tt>:: Disable text wrapping in output.
  #                     (Default is to wrap text.)
  # <tt>:toc</tt>:: Include an instruction to create table of contents.
  class LaTeX < Pandoku::Format
    include Pandoku::InputFormat, Pandoku::OutputFormat

    def self.name
      :latex
    end

    def self.default_options
      { :parse_raw => false, :number_sections => false, :no_wrap => false,
        :toc => false }
    end
  end
end
