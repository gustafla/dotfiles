" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1
highlight Pmenu ctermbg=8
highlight PmenuSel ctermbg=1
highlight PmenuSbar ctermbg=0

set noswapfile
set autowrite
syntax on

" Leader key
let mapleader = ","

" 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" 80 characters is just fine
set textwidth=80

" Numbers
set number
set numberwidth=5

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

" TMCBeans inspo
inoremap <Leader>soutl System.out.println();<Left><Left>
inoremap <Leader>sout System.out.print();<Left><Left>
inoremap <Leader>pint Integer.parseInt();<Left><Left>
inoremap <Leader>pdou Double.parseDouble();<Left><Left>

" CMake OoS build
let $BUILD_NAME = fnamemodify(getcwd(), ':t')
noremap <F5> :wa<CR>:!cd debug && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j $(( $(nproc) + 1 )) -l $(nproc) && eval "./$BUILD_NAME"<CR>

" latex stuff
noremap <Leader>lw :w<CR>:!pdflatex %<CR>
