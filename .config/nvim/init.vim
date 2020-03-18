" Plugins 
call plug#begin('~/.config/nvim/plug')

Plug 'pangloss/vim-javascript'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'preservim/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'

call plug#end()

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Basics
syntax on
set showmatch
set number
set formatoptions+=o
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab 
set encoding=utf8
set nojoinspaces
set nomodeline
set noshowmode

" Backspace behavior like in any other editor
set backspace=indent,eol,start

" Show next 3 lines while scrolling
if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif

" Lighline
let g:lightline = {
  \ 'colorscheme': 'iceberg',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
\ }

" Color Scheme
set termguicolors
colorscheme iceberg

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Disable Arrow Keys
"nnoremap <up>    <nop>
"nnoremap <down>  <nop>
"nnoremap <left>  <nop>
"nnoremap <right> <nop>
"inoremap <up>    <nop>
"inoremap <down>  <nop>
"inoremap <left>  <nop>
"inoremap <right> <nop>

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" ALE fixing
let g:ale_enabled = 0
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Make emmet work on tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
