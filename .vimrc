" Must be first
set nocompatible


" Hmmmm
let mapleader = ","


" Fuzzy find
set rtp+=/usr/local/opt/fzf


" Plug begin
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

call plug#end()
" Plug end


" FZ bindings
nmap <Leader>f :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>a :Ag<CR>
nmap <Leader>b :Buffers<CR>


" Searching and stuff
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>


" NerdTree bindings
nmap <Leader><Tab> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1


" Allow file undo after close
set undofile
set backupdir=~/.vim/tmp,.
set directory=~/.vim/tmp,.
set undodir=~/.vim/tmp,.


" Sanity
set number
set encoding=utf-8
set backspace=2
set ruler
set scrolloff=3
set cursorline
set ttyfast

" Turn on JSX parsing for .js files also
let g:jsx_ext_required = 0


" Tabs, whitespace and friends
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


" Link to ubuntu/gui clipboard
set clipboard=unnamed


" Invisibles
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
set list
set listchars=nbsp:¬,tab:--,extends:»,precedes:«,trail:•


" Theming maddness
hi CursorLine ctermbg=black cterm=NONE
hi VertSplit ctermfg=black ctermbg=darkgray term=NONE
hi LineNr ctermfg=darkgrey
set fillchars+=vert:│


" Statusline
hi StatusLine ctermfg=darkgray ctermbg=white
hi StatusLineNC ctermfg=black ctermbg=white


" These options are required for colours
" to display properly when running vim in tmux
set background=dark
