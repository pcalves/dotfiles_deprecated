set nocompatible " This should be the first line. It sets vim to not be backwards compatible with vi.

"" Plug.vim (https://github.com/junegunn/vim-plug)
call plug#begin('~/.vim/plugged')

"" Plugins
Plug 'chriskempson/base16-vim'           " base16 color scheme for vim (also gvim)
Plug 'mattn/emmet-vim'                   " Emmet for vim, 'nuff said
Plug 'itchyny/lightline.vim'             " Statusline
Plug 'itchyny/lightline-powerful'        " Powerful settings for lightline
Plug 'vim-scripts/Align'                 " It's in the name: align text, declarations, pretty much anything
Plug 'Townk/vim-autoclose'               " Auto-inserts closing characters when applicable
" Plug 'Valloric/YouCompleteMe'            " fuzzy-search code completion engine
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
" Plug 'ternjs/tern_for_vim'               " JS code completion
Plug 'kien/ctrlp.vim'                    " Fuzzy path file finder, just like Sublime's
Plug 'ntpeters/vim-better-whitespace'    " Highlight trailing whitespace characters
Plug 'tpope/vim-commentary'              " Comment/Uncomment code
Plug 'tpope/vim-fugitive'                " git in vim ❤️
Plug 'tpope/vim-repeat'                  " . for plugins
Plug 'tpope/vim-surround'                " add surroundings to text (quotes, tags, brackets, etc.)
Plug 'tpope/vim-vinegar'                 " enhance netrw, never look at nerdtree again
Plug 'tpope/vim-speeddating'             " increment dates, times, numerals & ordinal (C-A/C-X)
Plug 'tpope/vim-characterize'            " ga improved: unicode, HTML entities, emoji codes
Plug 'Numkil/ag.nvim'                    " NeoVim version of Ag plugin, support async search
Plug 'tmhedberg/matchit'                 " % matches more than single characters (e.g. tag matching)
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle between absolute and relative line numbers
Plug 'benekastah/neomake'                " ansyc :make, run linters, builders, etc.
Plug 'editorconfig/editorconfig-vim'     " EditorConfig for vim, define coding styles b/w different editors & IDEs
Plug 'justinmk/vim-sneak'                " Vim motion plugin that jumps to any location specified by two characters (s{char}{char})
Plug 'vim-scripts/IndexedSearch'         " shows 'Nth match out of M' at every search
Plug 'nelstrom/vim-visual-star-search'   " start a * or # search from a vistual block
Plug 'nathanaelkane/vim-indent-guides'   " show indentation visually
Plug 'MattesGroeger/vim-bookmarks'       " bookmarks for vim
Plug 'SirVer/ultisnips'                  " snippets for vim
Plug 'scrooloose/syntastic'              " 🐴  runs files through external syntax checkers and displays any resulting errors to the user
" Color Schemes
Plug 'altercation/vim-colors-solarized'
Plug 'acepukas/vim-zenburn'

" Snippets
Plug 'justinj/vim-react-snippets'

" Syntax highlighters, Pretty self-explanatory for the most part
Plug 'ap/vim-css-color' " THIS IS THE BEST. Shows colors defined in CSS & various pre-processor languages
Plug 'cakebaker/scss-syntax.vim'
Plug 'sheerun/vim-polyglot' " Collection of language packs for vim, regularly updated
" Plug 'evidens/vim-twig'
" Plug 'tpope/vim-haml'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" Plug 'othree/html5.vim'
" Plug 'xsbeats/vim-blade'
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'leafgarland/typescript-vim'

" vim niceties for various languages
Plug 'burnettk/vim-angular'
Plug 'kewah/vim-stylefmt'

" Add plugins to &runtimepath
call plug#end()




"" Color scheme
set background=dark
colorscheme zenburn





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
set tabstop=2 shiftwidth=2     " a tab is two spaces
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
nnoremap <silent> <leader>x :bd<CR>

" Force saving files that require root permission
cnoremap w!! w !sudo tee > /dev/null %




"" PLUGIN SETTINGS
set laststatus=2  " always show status line
" set showtabline=2 " always show tab line

"" neomake configuration
autocmd! BufWritePost * Neomake " run neomake on current file on every write (save)
" let g:neomake_javascript_enabled_makers = ['javascript']
" let g:neomake_error_sign = {
"     \ 'text': 'E>',
"     \ 'texthl': 'ErrorMsg',
" \ }

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
" set ts=4 sw=4 noet
hi IndentGuidesOdd  ctermbg=236 " IndentGuidesOdd
hi IndentGuidesEven ctermbg=238 " IndentGuidesEven

"" automatically format CSS with Stylefmt on save
" autocmd BufWritePre,FileWritePre *.css,*.less,*.scss,*.sass silent! :Stylefmt

"" configure ctrlp to ignore files set in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"" Syntastic config
" standardjs check for javascript
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_css_checkers = ['stylelint']

" recommended config (straight from project repo)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" TODO: make a separate config file for the mess below
"" lightline plugin configuration
set noshowmode " disable information shown by lightline
let g:lightline = {
            \ 'colorscheme': 'zenburn',
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



"" Eclim — code completion for PHP
let g:EclimCompletionMethod = 'omnifunc'
" function IniEclim()
"     if !filereadable("~/workspace/.metadata/.lock")
"         execute "!$ECLIM_PATH/eclimd &> /dev/null &"
"     endif
" :endfunction

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Use smartcase.
let g:deoplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:deoplete#sources#syntax#min_keyword_length = 3
let g:deoplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:deoplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:deoplete#keyword_patterns = {}
endif
let g:deoplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:deoplete#sources#omni#input_patterns')
    let g:deoplete#sources#omni#input_patterns = {}
endif


" Emmet autocomplete
" let g:user_emmet_expandabbr_key = '<Tab>'


" Mustache abbreviations
let g:mustache_abbreviations = 1

" Use JSX syntax in JS files
let g:jsx_ext_required = 0

" UltiSnips configs
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'
