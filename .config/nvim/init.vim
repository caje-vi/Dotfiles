set nocompatible

if has('autocmd')
  if has('spell')
    au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
  endif
  au BufNewFile,BufRead COMMIT_EDITMSG call feedkeys('ggi', 't')
endif

" auto-install vim-plug

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'rwxrob/vim-pandoc-syntax-simple'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'                                                     
    Plug 'morhetz/gruvbox'                                                        
call plug#end()

set hidden
set wildmenu
set wildignorecase
set wildignore=*.swp,*.bak
set wildignore+=*.pyc,*.class,*.sln,*.Master,*.csproj,*.csproj.user,*.cache,*.dll,*.pdb,*.min.*
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=tags
set wildignore+=*.tar.

"set path+=**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

nnoremap <leader>F :find <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>S :sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>V :vert sfind <C-R>=expand('%:h').'/*'<CR>
nnoremap <leader>T :tabfind <C-R>=expand('%:h').'/*'<CR>

syntax on
highlight ColorColumn ctermbg=darkgray

" enough for line numbers + gutter within 80 standard                           
set textwidth=72

" spellcheck
command Spell set spell spelllang=en,pt

" Enable folding
set foldmethod=indent
set foldlevel=99

set number
set relativenumber

" 24-bit colors
set termguicolors
" displays the command being typed
set showcmd
set background=dark
colorscheme gruvbox
let g:rainbow_active = 1
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
"indentation
set autoindent
set smartindent
"line at caracter number 80
set colorcolumn=80
set inccommand=split
" highlight
set hlsearch
set incsearch
set linebreak
set cursorline

" Shared clipboard
set clipboard=unnamed
" prevents truncated yanks, deletes, etc.                                       
set viminfo='20,<1000,s1000
" disable search highlighting with <C-L> when refreshing screen                 
nnoremap <C-S> :nohl<CR><C-S>

" navigating between buffers
nnoremap gb :ls<CR>:b<Space>

set wildcharm=<C-z>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>

" start at last place you were editing                                          
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
