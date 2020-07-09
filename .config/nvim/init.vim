" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tikhomirov/vim-glsl'
Plug 'dense-analysis/ale'
" Install rust for this
" Note for myself: install cargo-bloat (aur), cargo-edit (pacman),
" cargo-audit (pacman) and rust-racer (pacman) for Rust development.
" Also bat, exa, fd, ripgrep, tokei and ugdb (aur).
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
" Install python-pynvim for this
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Install python-jedi for this
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Leader key
let mapleader=","

" ALE
let g:ale_disable_lsp=1
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave=0
let g:ale_rust_cargo_use_clippy=1
let g:ale_c_clangtidy_checks=['*']
let g:ale_cpp_clangtidy_checks=['*']
let g:ale_linters = {
\   'c': ['clangtidy'],
\   'cpp': ['clangtidy'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\   'html': ['tidy'],
\   'python': ['black'],
\   'sh': ['shfmt'],
\}
nnoremap <C-n> :ALENext<CR>
nnoremap <leader>f :ALEFix<CR>
nnoremap <leader>lo :lopen<CR>

" Deoplete
let g:deoplete#enable_at_startup=1

" Disable airline extras
:let g:airline_extensions=['ale']

" Misc
set scl=no
set shellredir=>
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
