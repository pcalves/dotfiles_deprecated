set nocompatible " This should be the first line. It sets vim to not be backwards compatible with vi.

"" Plug.vim (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')

"" Plugins
Plug 'chriskempson/base16-vim'           " base16 color scheme for vim (also gvim)
Plug 'mattn/emmet-vim'                   " Emmet for vim, 'nuff said
Plug 'itchyny/lightline.vim'             " Statusline
Plug 'vim-scripts/Align'                 " It's in the name: align text, declarations, pretty much anything
Plug 'Townk/vim-autoclose'               " Auto-inserts closing characters when applicable
Plug 'ervandew/supertab'                 " Insert completions
Plug 'kien/ctrlp.vim'                    " Fuzzy path file finder, just like Sublime's
Plug 'ntpeters/vim-better-whitespace'    " Highlight trailing whitespace characters
Plug 'tpope/vim-commentary'              " Comment/Uncomment code
Plug 'tpope/vim-fugitive'                " git in vim ❤️
Plug 'tpope/vim-repeat'                  " . for plugins
Plug 'tpope/vim-surround'                " add surroundings to text (quotes, tags, brackets, etc.)
Plug 'tpope/vim-vinegar'                 " enhance netrw, never look at nerdtree again
Plug 'tpope/vim-speeddating'             " increment dates, times, numerals & ordinal (C-A/C-X)
Plug 'Numkil/ag.nvim'                    " NeoVim version of Ag plugin, support async search
Plug 'tmhedberg/matchit'                 " % matches more than single characters (e.g. tag matching)
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle between absolute and relative line numbers
Plug 'benekastah/neomake'                " ansyc :make, run linters, builders, etc.
Plug 'editorconfig/editorconfig-vim'     " EditorConfig for vim, define coding styles b/w different editors & IDEs

" Syntax highlighters, Pretty self-explanatory for the most part
Plug 'ap/vim-css-color' " THIS IS THE BEST. Shows colors defined in CSS & various pre-processor languages
Plug 'cakebaker/scss-syntax.vim'
Plug 'evidens/vim-twig'
Plug 'hail2u/vim-css3-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/html5.vim'
Plug 'xsbeats/vim-blade'

" vim niceties for various languages
Plug 'burnettk/vim-angular'

" Add plugins to &runtimepath
call plug#end()




"" Color scheme
set background=dark
colorscheme base16-default
let base16colorspace=256





"" MAIN SETTINGS
syntax on                            " Syntax highlighting
set encoding=utf-8
set showcmd                          " display incomplete commands
filetype plugin indent on            " load file type plugins + indentation
set number                           " show line numbers
set visualbell                       " No sounds
set autoread                         " Reload files changed outside vim
set cul                              " show cursor line
" :let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Only works with iTerm nightlies
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1  " Cursor is pipe in Insert, block in Normal
let mapleader = ","                  " Use comma as leader

" Swap file stuff. If you don't have one make an undodir in ~/.vim
" In terminal just type mkdir -p ~/.vim/undodir
set noswapfile
set hidden
set undofile
set undodir=~/.vim/undodir





"" Whitespace
set smartindent
set wrap linebreak nolist      " don't wrap lines
set breakindent                " sensible soft wrapping of lines
set tabstop=4 shiftwidth=4     " a tab is four spaces
set expandtab                  " use spaces, not tabs (optional)
set backspace=indent,eol,start " backspace through everything in insert mode




"" Folding settings
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " dont fold by default
set foldlevel=1       " this is just what i use




"" Searching
set hlsearch                       " highlight matches
set incsearch                      " incremental searching
set ignorecase                     " searches are case insensitive...
set smartcase                      " ... unless they contain at least one capital letter
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save





"" COMMAND MAPPINGS
" toggle current fold open/closed
nnoremap <Space> za
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <leader>n :bn<CR>
nnoremap <silent> <leader>p :bp<CR>





"" PLUGIN SETTINGS
set laststatus=2  " always show status line
" set showtabline=2 " always show tab line

"" neomake configiguration
autocmd! BufWritePost * Neomake " run neomake on current file on every write (save)
" let g:neomake_javascript_enabled_makers = ['javascript']
" let g:neomake_error_sign = {
"     \ 'text': 'E>',
"     \ 'texthl': 'ErrorMsg',
" \ }





" TODO: make a separate config file for the mess below
"" lightline plugin configuration
set noshowmode " disable information shown by lightline
let g:lightline = {
            \ 'colorscheme': 'jellybeans',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
            \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'filename': 'LightLineFilename',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \   'ctrlpmark': 'CtrlPMark',
            \ },
            \ 'component_expand': {
            \   'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \   'syntastic': 'error',
            \ },
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' }
            \ }

function! LightLineModified()
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
    return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
    let fname = expand('%:t')
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? g:lightline.fname :
                \ fname =~ '__Gundo\|NERD_tree' ? '' :
                \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
                \ &ft == 'unite' ? unite#get_status_string() :
                \ &ft == 'vimshell' ? vimshell#get_status_string() :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
    try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = ' '  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfunction

function! LightLineFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname == '__Gundo__' ? 'Gundo' :
                \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ &ft == 'unite' ? 'Unite' :
                \ &ft == 'vimfiler' ? 'VimFiler' :
                \ &ft == 'vimshell' ? 'VimShell' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfunction

let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
    return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfunction

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
