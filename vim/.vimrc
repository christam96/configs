"====================="
"     VIM PLUGINS     "
"====================="
call plug#begin('~/.vim/plugged')
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ " 
" {{{ PRODUCTIVITY }}}
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'vimwiki/vimwiki'
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
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <C-t> :tabnew <CR> 
map <C-w> :tabclose<CR>
map <S-J> :tabp<CR>
map <S-K> :tabn<CR
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
map <C-f> <Esc><Esc>:FZF<CR> 
inoremap <C-f> <Esc>:BLines!<CR>
" Let FZF find hidden files and folders
let $FZF_DEFAULT_COMMAND='find . -not -path "*/\.git*" -type f -print'

"====================="
"     Indent Line     "
"====================="
set listchars=tab:\|\ 
set list

"====================="
"      VIM WIKI       "
"====================="
" Requirements for Vim Wiki (other 'sets' already set)
set nocompatible

" {{{ Define Wikis }}}
let vimwiki = {}
let vimwiki.path = '~/Wikis/vimwiki/'
let vimwiki.path_html = '~/Wikis/vimwiki/'

let avowiki = {}
let avowiki.path = '~/Avo/avowiki/'
let avowiki.path_html = '~/Avo/avowiki/'

let g:vimwiki_list = [vimwiki, avowiki]

" {{{ Mappings }}}
nmap <Leader><Leader> <Plug>VimwikiGoBackLink
nmap <Leader>wf <Plug>VimwikiFollowLink

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

" {{{ Header Colours }}}
" Use hl-Title color for headers
let g:vimwiki_h1_headers = 0 
