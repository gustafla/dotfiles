" Plugins
call plug#begin(stdpath('data') . '/plugged')
Plug 'vim-airline/vim-airline'
Plug 'tikhomirov/vim-glsl'
Plug 'igankevich/mesonic'
Plug 'rust-lang/rust.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
call plug#end()

" Leader key
let mapleader=","

" Configure completion-nvim
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp', 'path']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP
" https://github.com/neovim/nvim-lspconfig
lua <<EOF
local lspconfig = require'lspconfig'
local util = require'lspconfig/util'

lspconfig.rust_analyzer.setup{}
lspconfig.pyls.setup{}
lspconfig.clangd.setup{}
lspconfig.r_language_server.setup{}
lspconfig.texlab.setup{
    settings = {
        latex = {
            build = {
                onSave = true;
            }
        }
    }
}
lspconfig.jdtls.setup{
    init_options = {
        workspace = util.path.join{vim.loop.os_homedir(), ".cache/jdtls"};
    }
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
  }
)
EOF

" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
" Show inlay hints in Rust projects
autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua
            \ require'lsp_extensions'.inlay_hints{ aligned=true }

" Various lsp mappings
nnoremap <silent> <leader>cp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>cn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>cl <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <leader>a  <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>d  <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>h  <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>i  <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>s  <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>t  <cmd>lua vim.lsp.buf.type_definition()<CR>

" Airline
let g:airline_extensions=[]
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
set hidden
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
nnoremap <silent> <C-p> :20Lex<CR>

" Sideways
noremap <silent> <C-h> :SidewaysLeft<CR>
noremap <silent> <C-l> :SidewaysRight<CR>
