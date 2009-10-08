require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # reStructuredText format. http://docutils.sourceforge.net/rst.html
  #
  # == Available Options
  #
  # <tt>:reference_links</tt>:: Use reference-style links,
  #                             rather than inline links, in writing.
  # <tt>:no_wrap</tt>:: Disable text wrapping in output.
  #                     (Default is to wrap text.)
  # <tt>:toc</tt>:: Include an instruction to create table of contents.
  class ReStructuredText < Pandoku::Format
    include Pandoku::InputFormat, Pandoku::OutputFormat

    def self.name
      :rst
    end

    def self.default_options
      { :reference_links => false, :no_wrap => false, :toc => false }
    end
  end

  # Aliases.
  ReST = RST = reStructuredText = ReStructuredText
end
