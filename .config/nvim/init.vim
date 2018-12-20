" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tikhomirov/vim-glsl'
Plug 'scrooloose/nerdtree'
Plug 'ajh17/VimCompletesMe'
call plug#end()

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

" Latex build
autocmd BufNewFile,BufRead *.tex command Build :wa|:!pdflatex %
autocmd BufNewFile,BufRead *.tex command Run :!xdg-open %:t:r.pdf &
" Make build
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,Makefile command Build :wa|:!make debug
autocmd BufNewFile,BufRead *.c,*.cpp,*.h,Makefile command Run :!make run
" Cargo build
autocmd BufNewFile,BufRead *.rs command Build :wa|:!cargo build
autocmd BufNewFile,BufRead *.rs command Run :!cargo run
" Groff ms build
autocmd BufNewFile,BufRead *.ms command Build :wa|:!groff -m latin9 -m ms -R -T pdf % > %:t:r.pdf
autocmd BufNewFile,BufRead *.ms command Run :!xdg-open %:t:r.pdf &

command B :Build
command R :Run
