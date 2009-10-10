require File.dirname(__FILE__) + '/format'

module Pandoku
  module Formats
    LOOKUP_TABLE = []

    class LookupError < IndexError; end

    # Find a format class by the +name+.
    # It raises +LookupError+ when it is not found,
    # or returns +nil+ if +raises_exception+ is +false+.
    def self.lookup(name, raises_exception = true)
      name = name.to_sym
      require "#{File.dirname(__FILE__)}/formats/#{name}"
      for format in LOOKUP_TABLE
        return format if format.name == name
      end
      return unless raises_exception
      raise LookupError, "there is no formatter named :#{name}"
    end
  end

  class Format
    def self.inherited(subclass)
      Formats::LOOKUP_TABLE << subclass
    end
  end

  class ::String
    # Translate the markup.
    #
    #   string.pandoku(:markdown => :html)
    #   string.pandoku(:markdown, :html)
    #   string.pandoku(:markdown, :html, :smart => true)
    def pandoku(from, to = nil, options = {})
      if to.nil? && from.is_a?(Hash) && from.size == 1
        to = from.values.first
        from = from.keys.first
      end
      raise ArgumentError, 'expected two arguments' if to.nil?
      decoder = Formats.lookup(from).new(options)
      encoder = Formats.lookup(to).new
      decoder.parse(self).compile(encoder)
    end
  end
end

