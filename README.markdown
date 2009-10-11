Pandoku
=======

Pandoku is a loose Ruby interface for [Pandoc][], the most powerful markup
processor written in Haskell.

> Pandoc is a [Haskell][] library for converting from one markup format to
> another, and a command-line tool that uses this library. It can read
> [markdown][] and (subsets of) [reStructuredText][rst], [HTML][],
> and [LaTeX][], and it can write [markdown][], [reStructuredText][rst],
> [HTML][], [LaTeX][], [ConTeXt][], [PDF][], [RTF][], [DocBook XML][docbook],
> [OpenDocument XML][opendocument], [ODT][], [GNU Texinfo][texinfo],
> [MediaWiki markup][mediawiki], [groff man][man] pages,
> and [S5][] HTML slide shows.

[pandoc]: http://johnmacfarlane.net/pandoc/
[haskell]: http://www.haskell.org/
[markdown]: http://daringfireball.net/projects/markdown/
[rst]: http://docutils.sourceforge.net/docs/ref/rst/introduction.html
[html]: http://www.w3.org/TR/html40/
[latex]: http://www.latex-project.org/
[context]: http://www.pragma-ade.nl/
[pdf]: http://en.wikipedia.org/wiki/Portable_Document_Format
[rtf]: http://en.wikipedia.org/wiki/Rich_Text_Format
[docbook]: http://www.docbook.org/
[opendocument]: http://opendocument.xml.org/
[odt]: http://en.wikipedia.org/wiki/OpenDocument
[texinfo]: http://www.gnu.org/software/texinfo/
[mediawiki]: http://www.mediawiki.org/wiki/Help:Formatting
[man]: http://developer.apple.com/DOCUMENTATION/Darwin/Reference/ManPages/man7/groff_man.7.html
[s5]: http://meyerweb.com/eric/tools/s5/


Installation
------------

Before install Pandoku, you should install [Pandoc][]. If [Haskell platform][]
is installed on your system, you should just use `cabal` tool.

    cabal install pandoc

Pandoku gem is distributed with [Gemcutter][].

    gem install gemcutter
    gem tumble
    gem install pandoku

[gemcutter]: http://gemcutter.org/
[haskell platform]: http://hackage.haskell.org/platform/


Simple Way
----------

It defines `String#pandoku` method.

    require 'pandoku'
    doc = <<MKD
    Pandoku
    =======

    [Pandoku][] is loose Ruby interface for [Pandoc][].

    [pandoku]: http://github.com/dahlia/pandoku
    [pandoc]: http://johnmacfarlane.net/pandoc/
    MKD
    puts doc.pandoku(:markdown => :html)

Above code prints following HTML:

    <div id="pandoku"
    ><h1
    >Pandoku</h1
    ><p
    ><a href="http://github.com/dahlia/pandoku"
      >Pandoku</a
      > is loose Ruby interface for <a href="http://johnmacfarlane.net/pandoc/"
      >Pandoc</a
      >.</p
    ></div
    >

