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

" Always show statusline
set laststatus=2
" Use 256 colours 
set t_Co=256
