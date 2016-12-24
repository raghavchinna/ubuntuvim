set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
filetype on

"Below is the leader key
:let mapleader = ","

"Below are commands to disable arrow keys in command mode"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set expandtab     " expand tabs into spaces
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set cursorline    " Displays line below the text where the cursor is present
set showmatch     " show the matching part of the pair for [] {} and ()
"Below are commented commands
"set nobackup
"set noswapfile

let python_highlight_all = 1    " Enable all python related features

"Below commands are to display white spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

"Below command is toggle between paste mode
set pastetoggle=<F2>

"Below line is for nerd tree mapping
map <C-n> :NERDTreeToggle<CR>

"Below is to enable navigation between windows.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
vnoremap <space> zf

"Automatically open NerdTree when vim is opened.
autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Below are added to load SimplyFold properly
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

"Below is added specific to python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"Below is added specific to javascript, html and css files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

"Below is added to display unessary white spaces
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set encoding=utf-8

"Below is added for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF

"Below is added for syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Below is added for solarized
syntax enable
set background=dark
colorscheme solarized

"Below is to add zenburn
colors zenburn

"Below logic defines solarized in GUI Mode and zenburn in non gui mode
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

"Below is toogle solarized mode to light and dark
call togglebg#map("<F5>")

map <Leader>n <plug>NERDTreeTabsToggle<CR>

"Below will hide .pyc files from nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set clipboard=unnamed

let g:solarized_termcolors=256

"Below is added for powerline setup
"http://www.linuxdeveloper.space/install-vim-powerline/
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2

"Below is added as part of the jedi-vim
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#show_call_signatures = "1"

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

"Below is used to run as python from command line
autocmd FileType python nnoremap <buffer> <F9> :exec '!clear; python' shellescape(@%, 1)<cr>
