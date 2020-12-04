" Plugins 
call plug#begin('~/.config/nvim/plug')

Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'hugolgst/vimsence'

call plug#end()

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Basics
syntax on
set showmatch
set number
set formatoptions+=o
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab 
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
  \ 'colorscheme': 'tokyonight',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ] ]
  \ }}

" Color Scheme
set termguicolors
colorscheme tokyonight

" Open file menu
nnoremap <Leader>o :GFiles<CR>
" Open buffer menu
nnoremap <Leader>b :Buffers<CR>

" Coc
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" Add eslint and prettier only when used in project
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Tab complete behavior like vscode
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Show docs in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

" Rich Presence
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
