require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # MediaWiki markup format. http://www.mediawiki.org/wiki/Help:Formatting
  #
  # == Available Options
  #
  # <tt>:toc</tt>:: Include an instruction to create table of contents.
  class MediaWiki < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :mediawiki
    end

    def self.default_options
      { :toc => false }
    end
  end
end
