" Leader key
let mapleader=","

" ALE
let g:ale_disable_lsp=1
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_enter=1
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
let g:deoplete#sources#rust#racer_binary='/usr/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/usr/src/rust/src'
let g:deoplete#sources#rust#disable_keymap=1

" Airline
let g:airline_extensions=['ale']
let g:airline_section_z='%l/%L'

" Misc
let g:python3_host_prog='/usr/bin/python3'
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
map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>

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

" Toggle :Lexplorer
nnoremap <C-p> :20Lex<CR>
