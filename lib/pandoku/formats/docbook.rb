require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # DocBook XML format. http://www.docbook.org/
  class DocBook < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :docbook
    end

    def self.default_options
      {}
    end
  end

  DocBookXML = DocBookXml = Docbook = DocBook
end
