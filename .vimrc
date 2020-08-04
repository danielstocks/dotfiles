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
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'peitalin/vim-jsx-typescript'
Plug 'w0rp/ale'
Plug 'neoclide/jsonc.vim'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
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
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" Gutter
set foldcolumn=2
hi FoldColumn ctermbg=0


" Hide the tilde characters for blank lines
hi EndOfBuffer ctermfg=0


" hightlight Selection
hi Visual ctermfg=black ctermbg=lightgray


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
set nonumber
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

" hide color column
hi ColorColumn ctermbg=0

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

" Enable spellcheck for markdown and mdx files
autocmd BufRead,BufNewFile *.md* setlocal spell textwidth=80 linebreak

" Disable markdown folding
let g:vim_markdown_folding_disabled = 1


" tsconfig.json is actually jsonc, help TypeScript set the correct filetype
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc


""""" CoC START

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" CoC extensions
let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver', 'coc-json']

" Add CoC Prettier if prettier is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Add CoC ESLint if ESLint is installed
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

""""" CoC END



