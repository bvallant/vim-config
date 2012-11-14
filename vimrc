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


set selectmode=
" normal backspace behavour
set backspace=indent,eol,start

" Use ctrl+movement keys instead of ctrl+w 
" to move between buffers
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

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
Bundle 'tpope/vim-fugitive'
" Deal with pairs of surroundings
Bundle 'tpope/vim-surround'
" GIT Syntax
Bundle 'tpope/vim-git'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
"Bundle 'fholgado/minibufexpl.vim'
" Bundle 'https://github.com/rygwdn/rope-omni.git'
" Bundle 'sontek/rope-vim'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'alfredodeza/pytest.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'vim-scripts/pep8'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'klen/python-mode'
Bundle 'othree/html5.vim'
"Bundle 'kevinw/yflakes-vim'
Bundle 'robhudson/snipmate_for_django'
Bundle 'jhchabran/vim-pigraph'
Bundle 'scrooloose/syntastic'
" original git repos
"
" To properly install "command-t" don't forget to compile the C-extension
"
"   $ cd ~/.vim/bundle/command-t/ruby/command-t
"   $ ruby extconf.h
"   $ make
"
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Lokaltog/vim-powerline'

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

" SuperTab lets us use tab for autocompletion in
" insert mode
let g:SuperTabDefaultCompletionType = 'context'

" pydoc preview :D
" <leader>pw opens pydoc for current module
set completeopt=menuone,longest,preview

" NERD tree
"" map <leader>n :NERDTreeToggle<CR>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

"" ignnore .pyc files
let NERDTreeIgnore = ['\.pyc$']

" Python Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>

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
set backup
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
" Persistent undos (vim 7.3+)
set undofile
set undodir=~/.vim/undo//

" Thanks to John Resig for the following 2 things:
"
" Tell vim to remember certain things when we exit
"   '10 : marks will be remembered for up to 10 previously edited files
"   "100 : will save up to 100 lines for each register
"   :20 : up to 20 lines of command-line history will be remembered
"   % : saves and restores the buffer list
"   n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" vim7.3+ has colorcolumn support - otherwise fake it
"             ^-  highlight linelenghts exceeding XX
if exists('+colorcolumn')
    set colorcolumn=79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%79v.\+', -1)
endif

" Color Scheme
set background=dark
if has("gui_running")
    colorscheme torte
    set guifont=Monospace\ 10  " use this font 
    " set guifont='Menlo-Powerline'\ 10  " use this font 
    set lines=50       " height = 50 lines
    set columns=100        " width = 100 columns
    " set selectmode=mouse,key,cmd
else
    colorscheme desert
endif

" GUI Options (MacVim/gVim)
" set guifont=Monospace:h10.00
" hide the toolbar
set guioptions-=T

" Omni Completion
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType html set omnifunc=htmlcomplete#CompleteTags
au FileType css set omnifunc=csscomplete#CompleteCSS
" au FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=RopeCompleteFunc
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
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y


" PYTHON MODE
" disable breakpoint because CommandT is using <leader>b
let g:pymode_indent = 1
let g:pymode_breakpoint=0
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
