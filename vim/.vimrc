""""""""""""""""""""""""" VUNDLE
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'unblevable/quick-scope'
Plugin 'easymotion/vim-easymotion'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'wellle/targets.vim'

call vundle#end()

filetype plugin indent on
" :PluginInstall

""""""""""""""""""""""""" NerdTree
" open when no file specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open when directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Ctrl+n toggle nerdtree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""" ALE
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""" GENERAL 
set number
set showcmd
set showmode
set autoread
set mouse=a
syntax on

"""""""""""""""""""""""" INDENTATION
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Easier indentation shortcuts
vmap <Tab> >gv
vmap <S-Tab> <gv
vmap > >gv
vmap < <gv

" Don't wrap lines
set nowrap
" Wrap lines at convenient points
set linebreak

"""""""""""""""""""""""" SEARCH
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

"""""""""""""""""""""""" WINDOW
" Use only one key to move between windows (C-W j -> C-j)
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
" Natural Split (New panels to the right)
set splitbelow
set splitright

" Others
" set relativenumber
set nohlsearch
set hidden
set smartcase
set ignorecase
set scrolloff=8


let mapleader = " "

set timeout timeoutlen=700 ttimeoutlen=100

" paste last thing yanked, not deleted
nmap <leader>p "0p
nmap <leader>P "0P

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

" use systemps clipboard
set clipboard=unnamedplus

"""""""""""""""""""""""" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
set t_Co=256
set laststatus=1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

map <leader><leader>r :set relativenumber!<CR>
" Fuzzy finder
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>F :Rg<CRke>
" tmux splits
nmap <leader>" :split <CR>
nmap <leader>% :vsplit <CR>
nnoremap <leader>Y ggyG

" Move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Function commands
nnoremap yaf va{Vo{y<CR>
nnoremap caf va{Vo{c<CR>
nnoremap daf va{Vo{d<CR>
nnoremap caf va{Vo{c<CR>

" source vimrc
nnoremap <Leader><CR> :so ~/.vimrc<CR>
" Colorscheme
set termguicolors 
let ayucolor="dark"
colorscheme ayu
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <C-E> :copen<CR>
