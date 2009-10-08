require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # ConTeXt format. http://www.pragma-ade.nl/
  #
  # == Available Options
  #
  # <tt>:no_wrap</tt>:: Disable text wrapping in output.
  #                     (Default is to wrap text.)
  # <tt>:toc</tt>:: Include an instruction to create table of contents.
  class ConTeXt < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :context
    end

    def self.default_options
      { :no_wrap => false, :toc => false }
    end
  end
end
