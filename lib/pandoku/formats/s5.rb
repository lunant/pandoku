require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # S5 HTML slide show format. http://meyerweb.com/eric/tools/s5/
  #
  # == Available Options
  #
  # <tt>:incremental</tt>:: Make list items in S5 display incrementally
  #                         (one by one).
  class S5 < Pandoku::Format
    include Pandoku::OutputFormat

    def self.name
      :s5
    end

    def self.default_options
      { :incremental => false }
    end
  end
end
