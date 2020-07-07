" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tikhomirov/vim-glsl'
Plug 'neomake/neomake'
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

" Neomake
call neomake#configure#automake('rw')
let g:neomake_c_enabled_makers=['makeprg']
let g:neomake_place_signs=0
hi NeomakeErrorSign ctermfg=black ctermbg=red
hi NeomakeWarningSign ctermfg=black ctermbg=yellow
hi NeomakeVirtualtextWarning ctermfg=lightgray
nnoremap <C-n> :NeomakeNextLoclist<CR>

" Deoplete
let g:deoplete#enable_at_startup=1

" Disable airline extras
:let g:airline_extensions=['neomake']

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
let mapleader=","

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

" Default behavior for building, running and formatting
nnoremap <leader>m :!make<CR>
nnoremap <leader>n :!make run<CR>
nnoremap <leader>f gg=G``
