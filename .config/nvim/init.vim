set nocompatible
let g:mapleader = "\<Space>"

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-github'
Plug 'ncm2/ncm2-path'
Plug 'junegunn/fzf.vim'
call plug#end()

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set autoindent
set shiftround
set expandtab

colorscheme base16-gruvbox-dark-hard
set termguicolors

let g:airline_powerline_fonts = 1

set number

inoremap jj <Esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <A-j> :tabn<CR>
nnoremap <A-k> :tabp<CR>
nnoremap <silent> <leader><leader>  :Files<CR>
nnoremap <silent> <leader>g         :GFiles<CR>
nnoremap <silent> <leader>r         :Buffers<CR>

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Rust
let g:rustfmt_autosave = 1

" LanguageClient
set hidden
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> S :call LanguageClient#textDocument_documentSymbol()<CR>

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

