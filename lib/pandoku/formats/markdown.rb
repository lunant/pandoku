require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # Markdown format. http://daringfireball.net/projects/markdown/
  #
  # == Available Options
  #
  # <tt>:strict</tt>:: Use strict syntax, with no extensions or variants.
  # <tt>:reference_links</tt>:: Use reference-style links,
  #                             rather than inline links, in writing.
  # <tt>:smart</tt>:: Use smart quotes, dashes, and ellipses.
  # <tt>:no_wrap</tt>:: Disable text wrapping in output.
  #                     (Default is to wrap text.)
  # <tt>:sanitize_html</tt>::
  #     Sanitizes HTML using a whitelist.  Unsafe tags are replaced by
  #     HTML comments; unsafe attributes are omitted.  URIs in links and
  #     images are also checked against a whitelist of URI schemes.
  # <tt>:toc</tt>:: Include an automatically generated table of contents.
  class Markdown < Pandoku::Format
    include Pandoku::InputFormat, Pandoku::OutputFormat

    def self.name
      :markdown
    end

    def self.default_options
      { :strict => false, :reference_links => false, :smart => false,
        :no_wrap => false, :sanitize_html => false, :toc => false }
    end
  end
end
