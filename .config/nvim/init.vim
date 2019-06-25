set nocompatible
let g:mapleader = "\<Space>"

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set autoindent
set shiftround
set expandtab

set termguicolors
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

nmap <A-k> <Plug>(ale_previous_wrap)
nmap <A-j> <Plug>(ale_next_wrap)

nnoremap <silent> <leader>, :e $HOME/.config/nvim/init.vim<CR>

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

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'markdown': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

" CoC
autocmd FileType markdown let b:coc_pairs_disabled = ['`']
autocmd FileType vim let b:coc_pairs_disabled =['"']

" Based on example config
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>j  <Plug>(coc-format-selected)
nmap <leader>j  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>p  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
