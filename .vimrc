syntax on
set ignorecase
set smartcase
set incsearch
set wildignore=*.o,*.obj,*.bak,*.exe
set tabstop=4
set hlsearch

highlight CursorLine cterm=NONE ctermbg=white ctermfg=black guibg=white guifg=black

function! DoXMLFormat()
  silent %! XMLLINT_INDENT="    " xmllint --format -
endfunction
command! XMLFormat call DoXMLFormat()
