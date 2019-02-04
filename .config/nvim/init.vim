" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tikhomirov/vim-glsl'
Plug 'scrooloose/nerdtree'
Plug 'ajh17/VimCompletesMe'
Plug 'vim-scripts/a.vim'
Plug 'racer-rust/vim-racer'
call plug#end()

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Misc
set noshowmode
set noswapfile
set autowriteall
set autoread
set tabstop=4
set shiftwidth=4
set shiftround
set noexpandtab
syntax on

" Leader key
let mapleader = ","

" Display extra whitespace
set list listchars=tab:\ \ ,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" 80 characters is just fine
set textwidth=80

" Line numbers
"set number
"set numberwidth=5

" Shortcut for a.vim
nnoremap <leader><leader> :A<CR>

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

" Racer navigation
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
