" Vim-plug Plugins
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
set laststatus=2 " Sets bar powerbar for lightline
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gilgigilgil/anderson.vim'
Plug 'wadackel/vim-dogrun'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sheerun/vim-polyglot'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'preservim/nerdcommenter'
call plug#end()

" Colors
syntax on
colorscheme morning
colorscheme anderson
colorscheme dogrun
colorscheme dracula
set background=dark
colorscheme palenight
let g:palenight_terminal_italics=1 " Enables italics
" let g:lightline = { 'colorscheme': 'palenight' }

" Spaces & Tabs
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 "indents will have a width of 4 spaces
set expandtab " turns tabs into spaces
set softtabstop=4 " number of spaces in tab when editing
set breakindent " indent word-wrapped lines as much as the 'parent' line
set formatoptions=l
set lbr " ensures word-wrap does not split words

" UI Config
set number
set cursorline " highlight current line

" Searching
set incsearch " search as characters are enetered
set hlsearch " highlight matches
set ignorecase " enable case insensitive searching
set smartcase " if search pattern contains upper case, enable case sensitive searching
" turn off search highlight
nnoremap <CR> :nohlsearch<CR><CR>

" Movement
nnoremap j gj
nnoremap k gk

" Copy/Paste
set mouse=a

" Mappings
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
map <C-t> :tabnew <CR> 
map <C-w> :tabclose<CR>
if (has("termguicolors"))
  set termguicolors
endif

" Toggle file type plugin 
filetype plugin on
