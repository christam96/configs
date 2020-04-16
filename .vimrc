" Colors
syntax on
colorscheme morning

" Spaces & Tabs
set tabstop=4 " number of visual spaces per TAB
set shiftwidth=4 "indents will have a width of 4 spaces
set expandtab " turns tabs into spaces
set softtabstop=4 " number of spaces in tab when editing

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

" Copy/Pase
set mouse=a

