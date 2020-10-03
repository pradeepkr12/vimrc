set nocompatible              " be iMproved, required
"filetype off                  " required
filetype plugin on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'dkarter/bullets.vim'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'jeetsukumaran/vim-pythonsense'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'davidhalter/jedi-vim'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'jpalardy/vim-slime'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vimwiki/vimwiki'
Plugin 'haya14busa/incsearch.vim'
Plugin 'crusoexia/vim-dracula'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-scripts/tComment'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'lygaret/autohighlight.vim'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'francoiscabrol/ranger.vim'
"Plugin 'craigemery/vim-autotag'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'majutsushi/tagbar'
Plugin 'python-mode/python-mode'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'fs111/pydoc.vim'
Plugin 'zivyangll/git-blame.vim'
Plugin 'ambv/black'

" configurations
let mapleader = ','
" select in visual mode and replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
" ysw' for putting quotes in a selected word
" for seeing the gitblame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
" jedi configs
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:pymode_rope = 0


" pydocstring
let g:pydocstring_formatter = 'numpy'
" fix for jk not working
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" set status line to right

set encoding=utf-8
"Plugin 'haya14busa/incsearch.vim'
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
" set theme 
set background=dark
colorscheme solarized

let g:ycm_python_binary_path = 'python'
set clipboard=unnamed
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
let g:syntastic_python_flake8_args='--ignore=E502,E302,W0401'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set noswapfile

let g:airline#extensions#tabline#enabled = 1


nnoremap <leader>rn :set relativenumber!<cr>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
inoremap JK <esc>
imap jk <Esc>


nmap H 0
nmap L $

vmap H 0
vmap L $


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
map <C-n> :NERDTreeToggle<cr>

" chaning the color of comment line
hi Comment ctermfg=LightBlue
" selecting the matching brace
noremap % v%
" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" noh problem, use f10 to toggle it
map  <F10> :set hls!<CR>
imap <F10> <ESC>:set hls!<CR>a
vmap <F10> <ESC>:set hls!<CR>gv
" close pc
map  <F12> :pc<CR>
imap <F12> <ESC>:pc<CR>a
vmap <F12> <ESC>:pc<CR>gv
" move to next buffer
map  <F9> :bn<CR>
imap <F9> <ESC>:bn<CR>a
vmap <F9> <ESC>:bn<CR>gv
" move to next buffer
map  <F8> :bp<CR>
imap <F8> <ESC>:bp<CR>a
vmap <F8> <ESC>:bp<CR>gv

" page up 
map  <F4> <C-b>
imap <F4> <C-b>
vmap <F4> <C-b>

" page down
map  <F3> <C-f>
imap <F3> <C-f>
vmap <F3> <C-f>

" vim airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
set tags=tags
set guifont=Monaco:h14
" ctags setting
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
"map <C-]> <C-T>
" making bold text
set concealcursor=n
set conceallevel=3
hi Asterisks NONE
hi AsteriskBold  cterm=bold gui=bold
syn match Asterisks contained "**" conceal
syn match AsteriskBold "\\\@<!\*\*[^"*|]\+\*\*" contains=Asterisks

" markdown setting
let vim_markdown_preview_github=1
" ag search integration
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" quick save 
map <Esc><Esc> :w<CR>
inoremap <C-s> <esc>:w<cr>                 " save files
nnoremap <C-s> :w<cr>
inoremap <C-d> <esc>:wq!<cr>               " save and exit
nnoremap <C-d> :wq!<cr>
inoremap <C-q> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-q> :qa!<cr>

" vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}
nmap ss <Plug>SlimeLineSend
"nmap sc <Plug>SlimeSendCell
nmap sr <Plug>SlimeParagraphSend
"nmap sf <Plug>SlimeConfig
let g:slime_python_ipython = 1
" fugitive git bindings
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gh :Glog<CR>
nnoremap <Leader>gH :Glog<CR>:set nofoldenable<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gp :Git push<CR>
" close buffer short cut
nnoremap <leader>q :bd<CR>
