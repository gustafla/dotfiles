" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

" rust
let g:rustc_path = '/usr/bin/rustc'

" deoplete
let g:deoplete#enable_at_startup = 1
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=0
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Misc
set noshowmode
set noswapfile
set autowrite
syntax on

" Leader key
let mapleader = ","

" 4 spaces is most common
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" 80 characters is just fine
set textwidth=80

" Line numbers
"set number
"set numberwidth=5

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Auto pairing
inoremap {      {}<Left>
inoremap {<CR>  {<CR><CR>}<Up><Tab>
inoremap {{     {
inoremap {}     {}
inoremap (      ()<Left>
inoremap (<CR>  (<CR><CR>)<Up><Tab>
inoremap ((     (
inoremap ()     ()

" Latex build
autocmd BufNewFile,BufRead *.tex noremap <F5> :wa<CR>:!pdflatex %<CR>
autocmd BufNewFile,BufRead *.tex noremap <F6> :!xdg-open %:t:r.pdf<CR>
" Make build
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,Makefile noremap <F5> :wa<CR>:!make debug<CR>
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,Makefile noremap <F6> :!make run<CR>
