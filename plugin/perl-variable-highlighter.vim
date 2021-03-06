" Vim plugin to highlight variables in Perl.

function! s:highlight_perl_variable()
    if ( exists( "w:current_match" ) )
        call matchdelete( w:current_match )
        unlet w:current_match
    endif

    let l:old_iskeyword = &iskeyword
    setlocal iskeyword=@,$,%,_,48-57,192-255,@-@
    let l:word = expand( '<cword>' )
    let &l:iskeyword = l:old_iskeyword

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


augroup HighlightVar
    autocmd!
    autocmd FileType perl :autocmd CursorMoved * call <SID>highlight_perl_variable()
    autocmd FileType perl :autocmd CursorMovedI * call <SID>highlight_perl_variable()
augroup END

" only add the highlight group if it doesn't already exist.
" this way, users can define their own highlighting with their
" favorite colors by having a "highlight PerlVarHiLight ..." statement
" in their .vimrc
if ( ! hlexists( 'PerlVarHiLight' ) )
    highlight PerlVarHiLight ctermbg=NONE guibg=NONE guifg=LightRed ctermfg=Red gui=NONE
endif
