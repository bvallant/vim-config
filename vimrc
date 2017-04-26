""" originell vimrc
"""
""" If you are using MacVIM note that
""" <leader> means \

set nocompatible     " be iMproved
filetype off         " required for Vundle

set foldmethod=indent
set foldlevel=99
let mapleader = ","

set wildignore+=*.pyc
set wildignore+=*.o,*.obj,.git,*.pyc,static/**

set shell=/bin/bash

set incsearch
set hlsearch

set selectmode=
" normal backspace behavour
set backspace=indent,eol,start

" Use ctrl+movement keys instead of ctrl+w 
" to move between buffers
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

nnoremap <silent> + :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winwidth(0) * 2/3)<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" cursor keys to move to next and previous tab
map <c-left> :tabprev<CR>
map <c-right> :tabnext<CR>

" cursor keys to move to next and previous buffer
map <c-up> :bprev<CR>
map <c-down> :bnext<CR>

" Vundle
" Brief help
"
" :BundleInstall  - install bundles (won't update installed)
" :BundleInstall! - update if installed
"
" :Bundles foo    - search for foo
" :Bundles! foo   - refresh cached list and search for foo
"
" :BundleClean    - confirm removal of unused bundles
" :BundleClean!   - remove without confirmation
"
" see :h vundle for more details
" or wiki for FAQ
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles:
"
" Repos on GitHub
" ===============
"
" GIT integration
" Bundle 'joker1007/vim-metarw-github-issues'
Bundle 'tpope/vim-fugitive'
Bundle 'syngan/vim-gitlab'
" Bundle 'junegunn/vim-github-dashboard'
" Deal with pairs of surroundings
Bundle 'tpope/vim-surround'
" GIT Syntax
Bundle 'tpope/vim-git'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'mileszs/ack.vim'
Bundle 'ervandew/screen'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'klen/python-mode'
Bundle 'othree/html5.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'flazz/vim-colorschemes'
Bundle 'SirVer/ultisnips'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'reinh/vim-makegreen'
Bundle 'jmcomets/vim-pony'
Bundle 'drmikehenry/vim-fontsize'
Bundle 'editorconfig/editorconfig-vim'
" JSX Support (for React)
Plugin 'mxw/vim-jsx'
" New JavaScript Indent and Highlighter. Required for vim-jsx
Plugin 'pangloss/vim-javascript'
" Ansible
Plugin 'pearofducks/ansible-vim'
" Autoclosing brackets/paranthesis/...
Plugin 'Raimondi/delimitMate'
" CSS3 Support
Plugin 'hail2u/vim-css3-syntax'
" SASS/SCSS
Plugin 'tpope/vim-haml'
" Comments for multiple langs
Plugin 'tomtom/tcomment_vim'
" Syntastic! Syntax checking for all the languages ;-)
Plugin 'scrooloose/syntastic'

filetype plugin indent on     " required for Vundle 

" TaskList default mapping is <leader>t, which basically always
" conflicts with other plugins.
" furthermore it would slow down the opening of CommandT
nmap <leader>do <Plug>TaskList

map <leader>g :GundoToggle<CR>

" disable pyflakes quickfix window
let g:pyflakes_use_quickfix = 0

" python pep8 violations in quickfix window
let g:pep8_map='<leader>8'

" pydoc preview :D
" <leader>pw opens pydoc for current module
set completeopt=menuone,longest,preview

" NERD tree
map <leader>n :NERDTreeToggle<CR>
"map <Leader>n <plug>NERDTreTabsToggle<CR>

"" ignnore .pyc files
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" ACK plugin :) (grep but with lot more awesome)
nmap <leader>a <Esc>:Ack!

" configure MakeGreen to use django manage.py test
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" === Disabled ===
" I don't need it right now and it 
" slows down start of CommandT
" so I'd need to remap it.. Feel free to do that ;-)
" ================
" py.test for more functionality for tests (individual files, classes,
" methods)
"" Execute the tests
"nmap <silent><Leader>tf <Esc>:Pytest file<CR>
"nmap <silent><Leader>tc <Esc>:Pytest class<CR>
"nmap <silent><Leader>tm <Esc>:Pytest method<CR>
"" cycle through test errors
"nmap <silent><Leader>tn <Esc>:Pytest next<CR>
"nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
"nmap <silent><Leader>te <Esc>:Pytest error<CR>

""" ====================
""" General VIM Settings
""" ====================

" Syntax highlighting
syntax on
" linenumbers
set number

" 1 Tab == 4 Spaces
set tabstop=4
" How many columns get inserted by reindent operations
set shiftwidth=4
" Insert blanks according to tabstop && shiftwidth
set smarttab
" Tab in insert mode indents
set expandtab
" well, automatic C style indentation
set autoindent

" display tabs and spaces
set listchars=tab:»·,trail:· 
" show trailing spaces as a circle. turn off with 'set nolist'
set list

" Highlight inconsistencies mixing tabs and spaces
" -- thx indygemma
highlight BadSpacing term=standout ctermbg=cyan
augroup Spacing
    autocmd!
    " Highlight tabulators and trailing spaces (nasty bastards)
    autocmd BufNewFile,BufReadPre * match BadSpacing /\(\t\|  *$\)/
    " Only highlight trailing space in tab-filled formats
    autocmd FileType help,make match BadSpacing /  *$/
augroup END

" source vimrc with <leader>s
map <Leader>s :source $MYVIMRC<cr>
" open up .vimrc in a vertical split with <leader>vv
map <Leader>vv <c-w><c-v>:e $MYVIMRC<cr>

" set the backup dir to declutter working directory.
" two ending slashes means, full path to the actual filename
" -- thanks to indygemma
silent! !mkdir -p ~/.vim/backup
silent! !mkdir -p ~/.vim/undo
silent! !mkdir -p ~/.vim/swap
"set backup
"set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
" Persistent undos (vim 7.3+)
set undofile
set undodir=~/.vim/undo//

" case insensitive search
set ignorecase
set smartcase

" Ever notice a slight lag after typing the leader key + command? This lowers the timeout.
set timeoutlen=500

" Thanks to John Resig for the following 2 things:
"
" Tell vim to remember certain things when we exit
"   '10 : marks will be remembered for up to 10 previously edited files
"   "100 : will save up to 100 lines for each register
"   :20 : up to 20 lines of command-line history will be remembered
"   % : saves and restores the buffer list
"   n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \ let JumpCursorOnEdit_foo = line("'\"") |
    \ let b:doopenfold = 1 |
    \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \ let b:doopenfold = 2 |
    \ endif |
    \ exe JumpCursorOnEdit_foo |
    \ endif |
    \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \ exe "normal zv" |
    \ if(b:doopenfold > 1) |
    \ exe "+".1 |
    \ endif |
    \ unlet b:doopenfold |
    \ endif
augroup END

" vim7.3+ has colorcolumn support - otherwise fake it
"             ^-  highlight linelenghts exceeding XX
if exists('+colorcolumn')
    let &colorcolumn=join(range(80,999),",")
    " set colorcolumn=79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%79v.\+', -1)
endif

" Color Scheme
set background=dark
if has("gui_running")
    "colorscheme torte
    colorscheme deveiate
    "set guifont=Ubuntu\ Mono\ Regular\ 11  " use this font 
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11  " use this font 
    " set guifont='Menlo-Powerline'\ 10  " use this font 
    set lines=50       " height = 50 lines
    set columns=100        " width = 100 columns
    " set selectmode=mouse,key,cmd
else
    colorscheme desert
endif

hi ColorColumn ctermbg=8 guibg=#111111
" GUI Options (MacVim/gVim)
" set guifont=Monospace:h10.00
" hide the toolbar, scrollbars etc...
" seems to be a bug, have to add them all first to remove them later on
set guioptions+=TLlRrbm
set guioptions-=TLlRrbm
set fillchars=vert:│

" Omni Completion
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType python set omnifunc=pythoncomplete#Complete
au FileType php set omnifunc=phpcomplete#CompletePHP
" robhudson's django snipmate bundle includes lots of
" snippets. If you are not working a lot with django
" and django/jinja templates, comment the following
" lines
au FileType python set ft=python.django
au FileType html set ft=htmldjango.html

" Use jj instead of ESC since it's pretty much
" of a stretch with the hand.
imap jj <Esc>

" Powerline Fancy Font :)
" You should really try this! See the Powerline readme.
let g:Powerline_symbols = 'fancy'

" COPY AND PASTE
nmap <C-V> "+gp
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y


" PYTHON MODE
let g:pymode_virtualenv = 1
let g:pymode_doc = 1
let g:pymode_indent = 1
let g:pymode_breakpoint=1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_lint_message = 1
let g:pymode_lint_write = 1   " enable code checking on every save
let g:pymode_run = 0          " Dont load the python run code within vim plugin
let g:pymode_lint_onfly = 0   " dont run code checking on the fly
let g:pymode_lint_ignore = "E127,E128,E123,E124"  " I have an indent style that
let g:pymode_rope_completion = 0 
let g:pymode_rope = 1  " We have JEDI now!
let g:pymode_rope_goto_definition_bind = '<leader>j'
let g:pymode_rope_goto_def_newwin = 'vnew'
let g:pymode_rope_regenerate_on_write = 0 " prevent hanging on write

let g:ackprg="ack-grep -H --nogroup --column"
" YouCompleteMe should not clash with UltiSnip's key mappings
let g:ycm_key_list_select_completion = ['<Down>']

" Move lines with alt j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let g:airline_powerline_fonts = 1

let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
" Ignores for CtrlP
let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
" Show more files in CTRL-P
let g:ctrlp_max_height = 30
let g:ctrlp_max_files = 75000
let g:ctrlp_max_depth = 100
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" Dont use selection when moving lines
xnoremap <  <gv
xnoremap >  >gv


" Enable mouse support for console vim
set mouse=a

" Syntastic should use ESLint for JSX support
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = []
" Inline JSX Support
let g:jsx_ext_required = 0
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
