" vim-plug
call plug#begin('~/.local/share/nvim/plugged')
Plug 'tikhomirov/vim-glsl'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'vim-scripts/a.vim'
call plug#end()

" Status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%=
set statusline+=\ width\ %{strwidth(getline('.'))}\ characters

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_c_auto_refresh_includes=1
let g:syntastic_c_config_file='.syntastic_c_config'

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" Misc
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

" 80 characters default
set textwidth=80
set colorcolumn=80

" Line numbers
"set number
"set numberwidth=5

" Shortcut for a.vim
nnoremap <leader><leader> :A<CR>

" Wayland copy and paste
nnoremap <leader>c :w !wl-copy<CR>
vnoremap <leader>c :'<,'>w !wl-copy<CR>
nnoremap <leader>p :r !wl-paste<CR>

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
