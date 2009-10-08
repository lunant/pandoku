require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # Unix man format.
  class Man < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :man
    end
  end

  # Aliases.
  Manual = Man
end
