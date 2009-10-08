require 'tempfile'
require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # ODT (OpenOffice text document) format.
  #
  # == Available Options
  #
  # <tt>:toc</tt>:: Include an automatically generated table of contents.
  class ODT < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :odt
    end

    def self.default_options
      { :toc => false }
    end

    def cliopts
      @tmpfile = @tmpfile || _tmpfile
      super + ["--output=#{@tmpfile}"]
    end

    # Compiles the given +document+ to the format.
    # If a second argument +file+ is +true+, returns +File+ instead of +String+.
    #
    # *Note* that it creates a temporary file for the result.
    # If +file+ is +false+, the temporary file become deleted.
    def compile(document, file = false)
      @tmpfile = _tmpfile
      ps = IO.popen(document.command_for(self), 'w')
      ps.print(document.text)
      ps.close
      f = File.new(@tmpfile, 'r')
      return f if file
      result = f.read
      f.close
      File.unlink(@tmpfile)
      return result
    end

    private

    def _tmpfile
      f = Tempfile.new('pandoku')
      path = f.path
      f.close(false)
      path
    end
  end
end
