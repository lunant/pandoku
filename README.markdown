Pandoku
=======

Pandoku is loose Ruby interface for [Pandoc][], the most powerful markup
processor written in Haskell.

> Pandoc is a Haskell library for converting from one markup format to another, and a command-line tool that uses this library. It can read markdown and (subsets of) reStructuredText, HTML, and LaTeX, and it can write markdown, reStructuredText, HTML, LaTeX, ConTeXt, PDF, RTF, DocBook XML, OpenDocument XML, ODT, GNU Texinfo, MediaWiki markup, groff man pages, and S5 HTML slide shows.

[pandoc]: http://homa.egloos.com/


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

