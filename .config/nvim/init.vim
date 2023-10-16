" Plugins 
call plug#begin('~/.config/nvim/plug')

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf' 
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'andweeb/presence.nvim'
Plug 'stevearc/oil.nvim'
Plug 'github/copilot.vim'
Plug 'joerdav/templ.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

call plug#end()

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
set relativenumber

" Backspace behavior like in any other editor
set backspace=indent,eol,start

" Show next 3 lines while scrolling
if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif

" Lighline
let g:lightline = {
      \ 'colorscheme': 'catppuccin_macchiato',
  \ 'active': {
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ] ]
  \ }}

" Color Scheme
set termguicolors
colorscheme catppuccin_macchiato

" Open file menu
nnoremap <C-o> :GFiles<CR>

" Open buffer menu
nnoremap <C-b> :Buffers<CR>

" Lua config
source $HOME/.config/nvim/lua/init.lua


