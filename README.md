# vim-perl-variable-highlighter

This Vim plugin will highlight all instances of the Perl variable under the
cursor.

![Imgur](https://i.imgur.com/yBnFrby.gif)

(Image credit: [Ovid](https://github.com/ovid))

Perl variables, of all types, will be highlighted.

## Credit

This was all spawned by [Ovid](https://github.com/ovid) who came up with the
idea to do this for perl. [Paul Johnson](https://github.com/pjcj) created a
[repository](https://github.com/pjcj/vim-hl-var) from the original code and
I somehow had the feeling that this could be done differently and came up
with what you are reading now.

## Installation

If you are using a package manager such as *Vundle* or *Pathogen*, this plugin
should be installed in the standard manner.  If you are not (why not?), you
could just copy `plugin/perl-variable-highlighter.vim` into your `~/.vim/plugins` directory.

Requires Vim version 7.3 or later.

## Configuration

You can customise the highlighting applied by this plugin by creating a highlight
group name `PerlVarHiLight` in your `.vimrc`. For example:

    highlight PerlVarHiLight ctermbg=black guifg=#ff0000 guibg=#000000 ctermfg=LightRed gui=bold

## Support 

I'm happy about pull requests. If you happen to have any questions or if you are
in the mood for a flame war, join `#vim` on `irc.perl.org`.

## See also

Damian Conway's version of this is far more advanced. See
[his talk at the Perl Conference 2016](https://www.youtube.com/watch?v=9u6O0dLuqhI)
and his [trackperlvars vim plugin](https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/plugin/trackperlvars.vim)

