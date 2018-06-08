" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"Plug 'vim-syntastic/syntastic'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'tikhomirov/vim-glsl'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
call plug#end()

" rust
let g:clang_library_path = '/usr/lib/x86_64-linux-gnu/libclang-6.0.so.1'
let g:rustc_path = '/usr/bin/rustc'

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

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

" echodoc
set noshowmode

" Misc
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

" Numbers
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
