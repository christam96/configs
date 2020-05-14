"====================="
"     VIM PLUGINS     "
"====================="
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ " 
" {{{ PRODUCTIVITY }}}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
" {{{ AESTHETICS }}}
Plug 'itchyny/lightline.vim'
set laststatus=2 " Sets bar powerbar for lightline
" {{{ COLOR SCHEMES }}}
Plug 'gilgigilgil/anderson.vim'
Plug 'wadackel/vim-dogrun'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Sierra'
Plug 'cocopon/iceberg.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'whatyouhide/vim-gotham'
Plug 'rakr/vim-one'
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ " 
call plug#end()

"====================="
"  SET COLOR SCHEME   "
"====================="
syntax on
"colorscheme morning
"colorscheme anderson
"colorscheme dogrun
"colorscheme dracula
"set background=dark
"colorscheme palenight
"colorscheme alduin
"colorscheme sierra
"colorscheme iceberg
"set background=light
"colorscheme PaperColor
"colorscheme deep-space
"colorscheme gotham
"let g:palenight_terminal_italics=1 " Enables italics
"let g:lightline = { 'colorscheme': 'palenight' }

"====================="
"   MISCELLANEOUS    "
"====================="
" {{{ Extend text motions }}}
let items = [ "<bar>", "\\", "/", ":", ".", "*", "_", "=" ]
for item in items
    exe "nnoremap yi".item." T".item."yt".item
    exe "nnoremap ya".item." F".item."yf".item
    exe "nnoremap ci".item." T".item."ct".item
    exe "nnoremap ca".item." F".item."cf".item
    exe "nnoremap di".item." T".item."dt".item
    exe "nnoremap da".item." F".item."df".item
    exe "nnoremap vi".item." T".item."vt".item
    exe "nnoremap va".item." F".item."vf".item
endfor

" {{{ Spaces & Tabs }}}
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 "indents will have a width of 4 spaces
set expandtab " turns tabs into spaces
set softtabstop=4 " number of spaces in tab when editing
set breakindent " indent word-wrapped lines as much as the 'parent' line
set formatoptions=l
set lbr " ensures word-wrap does not split words

" {{{ UI Config }}}
set number
set cursorline " highlight current line

" {{{ Searching }}}
set incsearch " search as characters are entered
set hlsearch " highlight matches
set ignorecase " enable case insensitive searching
set smartcase " if search pattern contains upper case, enable case sensitive searching
" turn off search highlight
nnoremap <CR> :nohlsearch<CR><CR>

" {{{ Movement }}}
" Make sure lines are traversed in a non-dumb way
nnoremap j gj
nnoremap k gk
set relativenumber 
" Enable mouse usage
set mouse=a

nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Mappings
nmap <F2> :echo 'Current time is ' . strftime('%c')<CR>
nmap <C-t> :tabnew <CR> 
nmap <C-w> :tabclose<CR>
nmap <S-J> :tabp<CR>
nmap <S-K> :tabn<CR>
nmap QQ :q!<CR>
nmap :light :set background=light
nmap ? :Diff
" Emulate system clipboard shortcuts
vnoremap <C-c> "+y  
inoremap <C-v> <ESC>"+pa
" Adjust vertical window size

if (has("termguicolors"))
     set termguicolors
endif

" Toggle file type plugin 
filetype plugin on

"====================="
"      SPELL CHECK    "
"====================="
" Turn on spell check for EN_CA
map <F5> :setlocal spell! spelllang=en_ca<CR>

"====================="
"         FZF         "
"====================="
" Open FZF search in Vim
map <C-f> <Esc><Esc>:FZF ~<CR> 
inoremap <C-f> <Esc>:BLines!<CR>
" Let FZF find hidden files and folders
let $FZF_DEFAULT_COMMAND='find . -not -path "*/\.git*" -type f -print'

"====================="
"     Indent Line     "
"====================="
set listchars=tab:\|\ 

"====================="
"      VIM WIKI       "
"====================="
" Requirements for Vim Wiki (other 'sets' already set)
set nocompatible
let vimwiki_dir_link = 'index'
" {{{ Define Wikis }}}
let Wikis = {}
let Wikis.path = '~/Wikis/'
let Wikis.path_html = '~/Wikis/'
let Wikis.ext = '.md'
let Wikis.syntax = 'markdown'

let Personal = {}
let Personal.path = '~/Avo/Wikis/Personal/'
let Personal.path_html = '~/Avo/Wikis/Personal/'
let Personal.ext = '.md'
let Personal.syntax = 'markdown'

let AvocadoCore = {}
let AvocadoCore.path = '~/Avo/Wikis/AvocadoCore/'
let AvocadoCore.path_html = '~/Avo/Wikis/AvocadoCore/'
let AvocadoCore.ext = '.md'
let AvocadoCore.syntax = 'markdown'

let ML = {}
let ML.path = '~/Avo/Wikis/ML/'
let ML.path_html = '~/Avo/Wikis/ML/'
let ML.ext = '.md'
let ML.syntax = 'markdown'

let g:vimwiki_list = [Wikis, AvocadoCore, ML]

" {{{ Mappings }}}
nmap , <Plug>VimwikiGoBackLink
nmap . <Plug>VimwikiFollowLink

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

" {{{ Header Colours }}}
" Use hl-Title color for headers
let g:vimwiki_h1_headers = 0 
