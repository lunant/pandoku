require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # ODT (OpenOffice text document) format.
  class ODT
    include OutputFormat

    def self.name
      :odt
    end

    def cliopts
      @tmpfile = @tmpfile || self._tmpfile
      "--output=#{@tmpfile} #{super.cliopts}"
    end

    def compile(document)
      @tmpfile = self._tmpfile
    end

    private

    def _tmpfile
      Dir.tmpdir
    end
  end
end
