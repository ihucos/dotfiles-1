autocmd BufEnter * lcd %:p:h

let g:NERDTreeDirArrows=0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:airline_powerline_fonts = 1
let g:ctrlp_map = '<c-t>'
let g:ctrlp_show_hidden = 1
let g:gundo_close_on_revert=1
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_quit_key='<Enter>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_start_key='<C-n>'
let g:pencil#textwidth = 74
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autopreview = 1
let g:tagbar_compact = 1
let g:tagbar_previewwin_pos = "rightbelow"
let g:user_emmet_install_global = 0
let g:user_emmet_mode='a'
let g:vim_json_syntax_conceal = 0
let g:yankring_replace_n_nkey = '<C-S-p>'
let g:yankring_replace_n_pkey = '<C-p>'
let g:yankring_history_dir = '$HOME/.vim/'
let g:yankring_history_file = '.yankring_history'

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let g:tagbar_type_asciidoc = {
    \ 'ctagstype' : 'asciidoc',
    \ 'kinds' : [
        \ 'h:Table of Contents',
        \ 'a:Anchors:1',
        \ 't:Titles:1',
        \ 'n:Includes:1',
        \ 'i:Images:1',
        \ 'I:Inline Images:1'
    \ ],
    \ 'sort' : 0
\ }

let g:tagbar_type_make = {
    \ 'kinds':[
        \ 'm:Macros',
        \ 't:Targets'
    \ ]
\}

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Table of Contents',
    \ ],
    \ 'sort' : 0
\ }

let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:Interfaces',
        \ 'I:Implementations',
        \ 'P:Protocols',
        \ 'p:Properties',
        \ 'M:Methods',
        \ 'c:Constants',
        \ 't:Typedefs',
        \ 'e:Enums',
        \ 'g:Pragmas',
    \ ],
\ }

let g:tagbar_type_swift = {
    \ 'ctagstype': 'swift',
    \ 'kinds' : [
        \ 'n:Enums',
        \ 't:Typealiases',
        \ 'p:Protocols',
        \ 's:Structs',
        \ 'c:Classes',
        \ 'f:Functions',
        \ 'v:Variables',
        \ 'e:Extensions'
    \ ],
    \ 'sort' : 0
\ }

set nocompatible
set clipboard=unnamed
set backspace=indent,eol,start
set lazyredraw
set scrolloff=4
set number
set ls=2
set tabstop=4
set shiftwidth=4
set incsearch
set ruler
set nobackup
set ignorecase
set ttyfast
set smartindent
set nocindent
set softtabstop=4
set expandtab
set virtualedit=all
set notimeout
set ttimeout
set timeoutlen=50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/build/*,*/docs/*,*/Pods/*
set encoding=utf-8
set hlsearch
syntax on
filetype plugin indent on

execute pathogen#infect()
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nmap n nzz
nmap <S-G> <S-G>zz
nmap <Leader>json :%!python -m json.tool<CR>
map <C-O> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <silent> <F6> :FixWhitespace<CR>
nnoremap <silent> <F7> :YRShow<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <Leader>mark :silent !open -a "Marked 2.app" "%:p"<cr>
nnoremap <leader>tl :vimgrep TODO % \| copen<CR>

autocmd FileType html,css EmmetInstall

autocmd BufNewFile,BufRead *.asciidoc set filetype=asciidoc
autocmd BufNewFile,BufRead *.asc set filetype=asciidoc
autocmd BufNewFile,BufRead *.dump set filetype=sql

autocmd BufWritePost,FileWritePost *.js silent! JSHint

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
  autocmd FileType asciidoc     call pencil#init()
augroup END

function! DefaultStyle()
    if exists("g:writemode")
        unlet g:writemode
    endif
    if exists("g:presmode")
        unlet g:presmode
    endif
    " Color
    set t_Co=256
    colorscheme PaperColor
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h14
    set number
    set background=light
    set showtabline=1
    set wrap
    set cursorline
    set nocursorcolumn
endfunction

call DefaultStyle()

