set nocompatible              " Don't be compatible with vi
let mapleader=","             " change the leader to be a comma vs slash

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$']
let NERDTreeIgnore=['\.log$']
let NERDTreeIgnore=['\.aux$']

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_

" Run command-t file search
map <leader>f :CommandT<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" ==========================================================
" Basic Settings 
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set nonumber                  " Don't display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" Auto change the directory to the current file I'm working on
autocmd BufEnter * lcd %:p:h


""" Moving Around/Editing
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
"set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set matchtime=2             " (for only .2 seconds).
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " an indent level is 4 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
"set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
" set statusline=%<%f\ (%{&ft})%=%-19(%3l,%02c%03V%)%{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list   "eg vil ekki dollaramerki eftir ollum linum

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
colorscheme ron


" Eydir whitespace i endann a linu"
autocmd BufWritePre *.yml,*.py,*.java,*.js,*.html,*.c :%s/\s\+$//e

"Loadar template ef faellinn er tomur"
function LoadTemplate()
        silent! 0r ~/.vim/skel/tmpl.%:e
    endfunction
autocmd BufNewFile * call LoadTemplate()

" Latex
filetype plugin on 
let g:tex_flavor='latex'  
let g:Tex_DefaultTargetFormat='pdf'
map <buffer> <c-o> :w<CR>:!pdflatex "%" && rm "%:t:r".log && rm "%:t:r".aux && rm "%:t:r".out<CR>

"Ekkert auto-folding
autocmd Filetype tex setlocal nofoldenable

map <buffer> <c-p> :w<CR>:!/usr/bin/env python2 -i "%" <CR>
"map <buffer> <c-j> :w<CR>:!javac "%" && java "%:t:r"<CR>
"map <buffer> <c-k> :w<CR>:!make "%:t:r" && ./"%:t:r"<CR>
"map <buffer> <c-l> :w<CR>:!evince "%:t:r".pdf && rm "%:t:r".log<CR>


" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Abbreviation for python
ab nmain if __name__ == "__main__": <tab>
let &titleold=getcwd()

autocmd BufRead,BufNewFile   *.c,*.h,*.cpp,*.hpp set tabstop=2 shiftwidth=2 softtabstop=2
set mouse=a " Faster navigation
set undodir=/home/trauzti/vimundo/
set backupdir=/home/trauzti/vimbackup/
set undofile 
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
"imap <esc> <nop>
set expandtab
autocmd BufRead,BufNewFile *.py imap _pd from ipdb import set_trace; set_trace()
set runtimepath^=~/.vim/bundle/gundo
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/taglist
set runtimepath^=~/.vim/bundle/vim-fugitive
nnoremap <silent> <F8> :TlistToggle<CR>
