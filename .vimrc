" Colors
syntax on
colorscheme morning

" Spaces & Tabs
set tabstop=4 " number of visual spaces per TAB
set expandtab " turns tabs into spaces
set softtabstop=4 " number of spaces in tab when editing

" UI Config
set number
set cursorline " highlight current line

" Seaching
set incsearch " search as characters are enetered
set hlsearch " highlight matches
" turn off search highlight
nnoremap <CR> :nohlsearch<CR><CR>

" Movement
nnoremap j gj
nnoremap k gk
