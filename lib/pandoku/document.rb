require File.dirname(__FILE__) + '/format'

module Pandoku
  # The path of Pandoc executable binary.
  PANDOC_PATH = ENV['PANDOC_PATH'] || 'pandoc'

  # Pseudo IR for Pandoc.
  class Document
    attr_reader :format, :text

    def initialize(format, text)
      unless format.is_a?(InputFormat)
        raise TypeError, 'format must be InputFormat'
      end
      @format = format
      @text = text
    end

    # Makes a command string to execute Pandoc.
    def command_for(format)
      commands = [PANDOC_PATH, '-f', self.format.class.name,
                              '-t', format.class.name]
      commands += self.format.cliopts
      commands += format.cliopts
      escapeshellarg = lambda do |arg|
        "'" + arg.to_s.gsub(/[^\\]'/) {|s| %<#{s.chars.first}\\'> } + "'"
      end
      commands.select {|v| v }.collect(&escapeshellarg).join(' ')
    end

    # Compiles the document to given +format+.
    # If a second argument +io+ is +true+, returns +IO+ instead of +String+.
    def compile(format, io = false)
      unless format.is_a?(OutputFormat)
        raise TypeError, 'format must be OutputFormat'
      end
      format.compile(self, io)
    end
  end
end

