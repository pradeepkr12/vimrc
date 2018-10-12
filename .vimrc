set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vimwiki/vimwiki'
Plugin 'haya14busa/incsearch.vim'
Plugin 'crusoexia/vim-dracula'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/tComment'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lygaret/autohighlight.vim'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'Asheq/close-buffers.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" set status line to right


"Plugin 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)

let g:ycm_python_binary_path = 'python'
set clipboard=unnamedplus
"easy motion 
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" store backup and swp files in these dirs to not clutter working dir
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
set t_Co=256   
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
if has('gui_running')
    set background=light
else
    set background=dark
endif


"Scroll by mouse
set mouse=a
" General defaults
set tabstop=4     " a tab is four spaces
set softtabstop=4
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set expandtab     " use appropriate number of spaces when tabbing
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000  " remember more commands and search history
set undolevels=1000
                  " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title         " change the terminal's title
set ruler         " show the cursor position all the time
set pastetoggle=<F2>
                  " toggle paste mode
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
                  " highlight whitespace
nmap <silent> <Leader>/ :nohlsearch <CR>
                  " unhighlight search
set viminfo='20,\"50
                  " Tell vim to remember certain things when we exit
set hidden        " allow buffers to be hidden
set wildmode=longest,list,full
set wildmenu
set directory=~/.vim/tmp
let g:ycm_keep_logfiles = 1
let g:ycm_log_level = 'debug'

let g:vim_json_syntax_conceal = 0
autocmd BufNewFile,BufRead *.json set ft=javascript

" SyntasticCheck
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_python_checkers = ['flake8', 'pep8', 'pyflakes', 'pylint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set noswapfile

let g:airline#extensions#tabline#enabled = 1

let mapleader = ','

nnoremap <leader>rn :set relativenumber!<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
inoremap JK <esc>

nmap H 0
nmap L $

vmap H 0
vmap L $

"command! Wfi split ~/vimwiki/workflow.wiki
"command! Ideas split ~/vimwiki/ideas.wiki

"nnoremap <leader>c $a     #

set runtimepath^=~/.vim/bundle/ctrlp.vim


set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

" The Silver Searcher
"if executable('ag')
  "" Use ag over grep
  "set grepprg=ag\ --nogroup\ --nocolor

  "" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  "" ag is fast enough that CtrlP doesn't need to cache
  "let g:ctrlp_use_caching = 0
"endif

" bind \ (backward slash) to grep shortcut
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" toggle between buffers
nnoremap <leader>bb :CtrlPBuffer<cr>

" Add hybrid numbers
set number relativenumber
set runtimepath^=~/.vim/bundle/ag
" set tab and shift tab for indent in insert mode and visual mode
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
" code folding
set foldmethod=indent
nmap <F6> :NERDTreeToggle<CR>
" chaning the color of comment line
hi Comment ctermfg=LightBlue
" selecting the matching brace
noremap % v%
" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" noh problem, use f12 to toggle it
map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv
" close pc
map  <F10> :pc<CR>
imap <F10> <ESC>:pc<CR>a
vmap <F10> <ESC>:pc<CR>gv
" move to next buffer
map  <F9> :bn<CR>
imap <F9> <ESC>:bn<CR>a
vmap <F9> <ESC>:bn<CR>gv
" move to next buffer
map  <F8> :bp<CR>
imap <F8> <ESC>:bp<CR>a
vmap <F8> <ESC>:bp<CR>gv

" page up 
map  <F3> <C-b>
imap <F3> <C-b>
vmap <F3> <C-b>

" page down
map  <F4> <C-f>
imap <F4> <C-f>
vmap <F4> <C-f>
