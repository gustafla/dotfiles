" Plugins
call plug#begin(stdpath('data') . '/plugged')
" Color schemes
Plug 'lifepillar/vim-solarized8'
Plug 'vim-airline/vim-airline-themes'
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
" Completion
Plug 'hrsh7th/nvim-compe'
" Misc
Plug 'vim-airline/vim-airline'
Plug 'tikhomirov/vim-glsl'
Plug 'igankevich/mesonic'
call plug#end()

" Leader key
let mapleader=","

" Set completeopt to enable nvim-compe
set completeopt=menuone,noselect

lua <<EOF
local lspconfig = require'lspconfig'
local util = require'lspconfig/util'

-- LSP Servers ----------------------------------------------------------------
require('rust-tools').setup{}
lspconfig.clangd.setup{}
lspconfig.r_language_server.setup{}
lspconfig.jedi_language_server.setup{}
lspconfig.texlab.setup{
    settings = {
        latex = {
            build = {
                onSave = true,
            },
        },
    },
}
lspconfig.jdtls.setup{
    init_options = {
        workspace = util.path.join{vim.loop.os_homedir(), ".cache/jdtls"},
    },
}

-- LSP Settings ---------------------------------------------------------------
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = false,
    }
)

-- Compe ----------------------------------------------------------------------
require'compe'.setup{
    enabled = true,
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
    },
}
EOF

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

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

" Use syntax highlighting
syntax on

" Use system python even in venv
let g:python3_host_prog='/usr/bin/python3'

" No sign column
set scl=no

" No swap files
set noswapfile

" 4 spaces as tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

" Allow to abandon a buffer when editing another one
set hidden

" Enable custom colors in terminals.
" Some plugins look ugly without a popular color scheme
set background=light
set termguicolors
colorscheme solarized8
let g:airline_theme='solarized'

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
nnoremap <leader>m <cmd>!make<CR>
nnoremap <leader>n <cmd>!make run<CR>

" Toggle :Lexplorer
nnoremap <silent> <C-p> <cmd>20Lex<CR>

" Browse buffers
noremap <silent> <C-h> <cmd>bnext<CR>
noremap <silent> <C-l> <cmd>bprevious<CR>
