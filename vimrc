let mapleader = " "

call plug#begin()

Plug 'preservim/nerdtree' 
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'rose-pine/vim'
Plug 'airblade/vim-gitgutter' " todo)) set keymap

call plug#end()

set background=dark
colorscheme rosepine

set number
set relativenumber
set cursorline

set mouse=a
set clipboard=unnamedplus
set nowrap
set hlsearch
set incsearch
set smartcase
set ignorecase

set expandtab
set tabstop=2
set shiftwidth=2

set splitbelow
set splitright
set nolist

" basic
nnoremap <esc> :noh<cr>
nnoremap gl $
nnoremap gh 0
nnoremap <leader>wd <C-w>c
nnoremap <leader>q :bd<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

vnoremap gl $
vnoremap gh 0

" plugins
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-s> :w<CR>

