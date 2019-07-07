set nocompatible
let g:mapleader = "\<Space>"

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'

Plug 'w0rp/ale'

Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim'

call plug#end()

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set autoindent
set shiftround
set expandtab

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
set background=light

let g:airline_powerline_fonts = 1

set number
set hidden
set cursorline
set updatetime=100

inoremap jj <Esc>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <silent> <leader>, :e $HOME/.config/nvim/init.vim<CR>

inoremap (( (<CR>)<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {{ {<CR>}<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [[ [<CR>]<C-c>O
inoremap [, [<CR>],<C-c>O

nmap <A-k> <Plug>(ale_previous_wrap)
nmap <A-j> <Plug>(ale_next_wrap)

" Customized :Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(join([
  \     "rg --column --line-number --no-heading --color=always --smart-case ",
  \     "--hidden --follow -g '!{.git,node_modules}/*' ",
  \     "-g '!{yarn.lock,package-lock.json,go.sum}' "
  \   ]).shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <leader><leader> :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>/ :BLines<CR>
nnoremap <silent> <leader>p :Commands<CR>
nnoremap <silent> <leader>r :Rg<CR>
nnoremap <silent> <leader><tab> :b#<CR>

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" Completion
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'markdown': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

