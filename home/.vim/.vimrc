set nocompatible " Disable vi-compatibility
" load pathogen
execute pathogen#infect()
"Enable filetypes
filetype plugin indent on
" solarized
set background=dark
colorscheme solarized
set number " always show line numbers
set guifont=menlo\ for\ powerline:h16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
syntax on

" Set up status line
set showcmd             " shows the command in the status line
set ch=2                " make command line 2 lines high
set ls=2                " status line always on
set linespace=2

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode " show mode we're editing on
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler  " Display current cursor position in lower right corner. 
set backspace=indent,eol,start
set laststatus=2
set undofile

"Enable code folding
set foldenable
set autowrite  "Save on buffer switch
set mouse=a

" handle lines
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" tab settings
set smarttab
set tags=tags
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting

"easier window navigation

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Fast saves
nmap <leader>w :w!<cr>

"autopen NERDTree and focus cursor in new document
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
