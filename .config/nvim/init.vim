" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tikhomirov/vim-glsl'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
" Install rust for this
Plug 'rust-lang/rust.vim'
" Install rust-racer for this
Plug 'racer-rust/vim-racer'
Plug 'vim-scripts/a.vim'
" Install python-pynvim for this
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Install python-jedi for this
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'wokalski/autocomplete-flow'
Plug 'vim-airline/vim-airline'
call plug#end()

" Disable airline extras
:let g:airline_extensions = ['syntastic']

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_c_auto_refresh_includes=1
let g:syntastic_c_config_file='.syntastic_c_config'
let g:syntastic_java_javac_config_file_enabled=1

" Shougo's plugins
let g:deoplete#enable_at_startup=1
let g:neosnippet#enable_completed_snippet=1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Shortcut for a.vim
nnoremap <leader><leader> :A<CR>

" Misc
set exrc
set secure
set noshowmode
set noswapfile
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
syntax on

" Leader key
let mapleader = ","

" Display extra whitespace
set list listchars=tab:>·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" 79 characters default
set textwidth=79
set colorcolumn=80
hi ColorColumn ctermbg=8

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Disable command window which I often open accidentally
nnoremap q: <Nop>

" Auto pairing
inoremap {      {}<Left>
inoremap {<CR>  {<CR><CR>}<Up><Tab>
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap (<CR>  (<CR><CR>)<Up><Tab>
inoremap ((     (
inoremap ()     ()
inoremap [      []<Left>
inoremap [<CR>  [<CR><CR>]<Up><Tab>
inoremap [[     [
inoremap []     []
inoremap <      <><Left>
inoremap <<     <
inoremap <>     <>
inoremap "      ""<Left>
inoremap ""     "
inoremap '      ''<Left>
inoremap ''     '

" Default behavior for building and running
nnoremap <leader>m :!make<CR>
nnoremap <leader>n :!make run<CR>
