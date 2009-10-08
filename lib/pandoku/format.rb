require 'open3'
require File.dirname(__FILE__) + '/document'

module Pandoku
  class Format
    attr_reader :options

    def self.name
      raise NotImplementedError,
            'Format.name should be overrided to return Symbol'
    end

    def self.default_options
      {}
    end

    def initialize(options = {})
      @options = self.class.default_options
      keys = @options.keys
      @options.merge!(Hash[options.select {|k, v| keys.include?(k) }])
    end

    def cliopts
      self.options.select {|k, v| v } \
                  .collect {|p| %<--#{p[0].to_s.gsub('_', '-')}> +
                                (p[1] != true ? %<=#{p[1]}> : '') }
    end
  end

  module InputFormat
    def parse(text)
      Document.new(self, text)
    end
  end

  module OutputFormat
    # Compiles the given +document+ to the format.
    # If a second argument +io+ is +true+, returns +IO+ instead of +String+.
    def compile(document, io = false)
      cin, cout, cerr = Open3.popen3(document.command_for(self))
      cin.print(document.text)
      cin.close
      return cout if io
      result = cout.read
      cout.close
      return result
    end
  end
end

