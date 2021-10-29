" {{{ VIM WIKI }}}
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Any valid git URL is allowed
" ex. Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
" ex. Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vimwiki/vimwiki'
" Use MarkDown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Initialize plugin system
call plug#end()

" {{{ UI Config }}}
 set number
" set cursorline " highlight current line

" {{{ Spaces & Tabs }}}
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 "indents will have a width of 4 spaces
set expandtab " turns tabs into spaces
set softtabstop=4 " number of spaces in tab when editing
set breakindent " indent word-wrapped lines as much as the 'parent' line
set formatoptions=l
set lbr " ensures word-wrap does not split words

" {{{ Movement }}}
" Make sure lines are traversed in a non-dumb way
nnoremap j gj
nnoremap k gk
 set relativenumber 
" Enable mouse usage
set mouse=a

" {{{ Searching }}}
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " enable case insensitive searching
set smartcase " if search pattern contains upper case, enable case sensitive searching
" turn off search highlight
nnoremap <CR> :nohlsearch<CR>

" {{{ Mappings }}}
" Emulate system clipboard shortcuts
vnoremap <C-c> "+y  
inoremap <C-v> <ESC>"+pa
" Fast quit
nmap QQ :q!<CR>
