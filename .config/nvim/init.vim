" Plugins 
call plug#begin('~/.config/nvim/plug')

Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'cocopon/iceberg.vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|vendor\'

" Coc
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>

" Make emmet work on tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Terminal
tnoremap <Esc> <C-\><C-n>?\$<CR>

