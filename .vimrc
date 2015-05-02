set nocompatible
set tabstop=2
set shiftwidth=2
set incsearch
set hlsearch

set ignorecase
set ruler
set cursorline
set smarttab
set smartindent
set showcmd			
set lazyredraw 
set expandtab
syntax enable 

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_extensions = ['smarttabs']

set background=dark

let g:solarized_termcolors = 256
"let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
"colorscheme grb256

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
filetype plugin indent on

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ctrlp_prompt_mappings = {
  \'CreateNewFire()': ['<c-o>'],
  \'ToggleRegex()': ['<F5>'],
  \'PrtClearCache()': ['<c-r>'],
\}

execute pathogen#infect()
map <C-n> :NERDTree .<CR>
let g:NERDTreeWinSize=31
