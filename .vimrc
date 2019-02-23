""""""""""""""""""""""""" VUNDLE
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'w0rp/ale'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on
" :PluginInstall

""""""""""""""""""""""""" NerdTree
" open when no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open when directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Ctrl+n toggle nerdtree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""" ALE
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1

"""""""""""""""""""""""" GENERAL 
set number
set paste
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
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Natural Split (New panels to the right)
set splitbelow
set splitright

" Autoclose Brackets 
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

let g:airline_powerline_fonts = 1
set t_Co=256

