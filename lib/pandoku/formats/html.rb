require File.dirname(File.dirname(__FILE__)) + '/format'

module Pandoku::Formats
  # HTML format.
  #
  # == Available Options
  #
  # * <tt>:standalone</tt> - Produce output with an appropriate header
  #   and footer.
  # * <tt>:parse_raw</tt> - Parse untranslatable HTML codes as raw HTML,
  #   instead of ignoring them.
  # * <tt>latexmathml</tt> - Use LaTeXMathML to display embedded TeX math in
  #   HTML output. To insert a link to a local copy of the <b>LaTeXMathML.js</b>
  #   script, provide a URL string. If just <tt>true</tt> is provided, the
  #   contents of the script will be inserted directly into the HTML header.
  # * <tt>:jsmath</tt> - Use jsMath to display embedded TeX math in HTML output.
  #   The URL should point to the jsMath load script; if provided,
  #   it will be linked to in the header of standalone HTML documents.
  # * <tt>:gladtex</tt> - Enclose TeX math in +<eq>+ tags in HTML output.
  #   These can then be processed by gladTeX to produce links
  #   to images of the typeset formulas.
  # * <tt>:mimetex</tt> - Render TeX math using the mimeTeX CGI script.
  #   If URL is not specified, it is assumed that the script is at
  #   <b>/cgi-bin/mimetex.cgi</b>.
  # * <tt>:no_wrap</tt> - Disable text wrapping in output.
  #   (Default is to wrap text.)
  # * <tt>:sanitize_html</tt> - Sanitizes HTML using a whitelist.
  #   Unsafe tags are replaced by HTML comments; unsafe attributes are omitted.
  #   URIs in links and images are also checked against a whitelist of URI
  #   schemes.
  # * <tt>:email_obfuscation</tt> -
  #   (<tt>nil</tt>|<tt>:javascript</tt>|<tt>:references</tt>)
  #   Specify a method for obfuscating <tt>mailto:</tt> links in HTML documents.
  #   * <tt>:nil</tt> leaves <tt>mailto:</tt> links as they are.
  #   * <tt>:javascript</tt> obfuscates them using javascript.
  #   * <tt>:references</tt> obfuscates them by printing their letters
  #     as decimal or hexadecimal character references.
  #     If <tt>:strict => true</tt> is specified, references is used regardless
  #     of the presence of this option.
  # * <tt>:toc</tt> - Include an automatically generated table of contents.
  # * <tt>:css</tt> -  Link to a CSS style sheet.
  #   The pathname of the style sheet goes value.
  # * <tt>:include_in_header</tt> - Include contents of the given filename
  #   at the end of the header. Implies <tt>:standalone</tt>.
  # * <tt>:include_before_body</tt> - Include contents of the given filename
  #   at the beginning of the document body.
  # * <tt>:include_after_body</tt> - Include contents of the given filename
  #   at the end of the document body.
  # * <tt>:custom_header</tt> - Use contents of the given filename as the
  #   document header. Implies <tt>:standalone</tt>.
  class HTML < Pandoku::Format
    include Pandoku::InputFormat, Pandoku::OutputFormat

    def self.name
      :html
    end

    def self.default_options
      { :standalone => false, :parse_raw => false, :latexmathml => nil,
        :jsmath => nil, :gladtex => false, :mimetex => nil, :no_wrap => false,
        :sanitize_html => false, :email_obfuscation => false, :toc => false,
        :css => nil, :include_in_header => nil, :include_before_body => nil,
        :include_after_body => nil, :custom_header => nil }
    end
  end
end
