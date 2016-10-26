au FocusLost * silent! wa
set autowriteall
set printoptions=paper:A4,syntax:y,portrait:y

function! PresentationStyle()
    if exists("g:writemode")
        unlet g:writemode
    endif
    if exists("g:presmode")
        call DefaultStyle()
    else
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h18
        colorscheme default
        AirlineTheme PaperColor
        set background=light
        set showtabline=1
        set number
        set wrap
        set cursorline
        set nocursorcolumn
        let g:presmode=1
    endif
endfunction
nmap <leader>PR :call PresentationStyle()<cr>

function! WriterStyle()
    if exists("g:presmode")
        unlet g:presmode
    endif
    if exists("g:writemode")
        call DefaultStyle()
    else
        colorscheme pencil
        set background=dark
        set nowrap
        set nonumber
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h18
        set showtabline=1
        set nocursorline
        set nocursorcolumn
        let g:writemode=1
    end
endfunction
nmap <leader>WR :call WriterStyle()<cr>

