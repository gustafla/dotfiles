" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tikhomirov/vim-glsl'
Plug 'vim-syntastic/syntastic'
" Install ctags for this
Plug 'majutsushi/tagbar'
" Install rust for this
Plug 'rust-lang/rust.vim'
" Install rust-analyzer and other language servers for this
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }
" Install python-pynvim for this
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Install python-jedi for this
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_c_auto_refresh_includes=1
let g:syntastic_c_config_file='.syntastic_c_config'
let g:syntastic_java_javac_config_file_enabled=1

" Tagbar
noremap <C-a> :TagbarToggle<CR>

" Language Client
let g:LanguageClient_serverCommands = {
            \ 'rust': ['rust-analyzer'],
            \ }

" Deoplete
let g:deoplete#enable_at_startup=1

" Disable airline extras
:let g:airline_extensions = ['syntastic']

" Netrw
noremap <C-n> :e .<CR>

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
