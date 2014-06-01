" Vim plugin to highlight variables in Perl.

function! s:highlight_perl_variable()
    if ( exists( "w:current_match" ) )
        call matchdelete( w:current_match )
        unlet w:current_match
    endif

    let l:old_iskeyword = &iskeyword
    set iskeyword=@,$,%,_,48-57,192-255,@-@
    let l:word = expand( '<cword>' )
    let &iskeyword = l:old_iskeyword

    " we only care about words starting with a sigil
    if ( -1 == match( l:word, '^[%$@]' ) ) 
        return
    endif

    " build up the match by replacing the sigil with the character class [$%@]
    " and appending a word-boundary:
    let l:match = substitute( l:word, '^[$@%]', '[$@%]', '' ) . '\>'

    " do the highlighting
    let w:current_match = matchadd( 'PerlVarHiLight', l:match )
endfunction


if ( ! exists( "g:hlvarnoauto" ) || g:hlvarnoauto == 1 )
    augroup HighlightVar
        autocmd!
        au FileType perl :au CursorMoved * call <SID>highlight_perl_variable()
        au FileType perl :au CursorMovedI * call <SID>highlight_perl_variable()
    augroup END

    " only add the highlight group if it doesn't already exist.
    " this way, users can define their own highlighting with their
    " favorite colors by having a "highlight PerlVarHiLight ..." statement
    " in their .vimrc
    if ( ! hlexists( 'PerlVarHiLight' ) )
        highlight PerlVarHiLight ctermbg=black guifg=#ff0000 guibg=#000000 ctermfg=LightRed gui=bold
    endif

    command! HlVar :call <SID>highlight_perl_variable()
endif
