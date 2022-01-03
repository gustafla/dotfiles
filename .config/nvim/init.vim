" Plugins
call plug#begin(stdpath('data') . '/plugged')
" Color schemes
Plug 'shaunsingh/solarized.nvim'
Plug 'vim-airline/vim-airline-themes'
" LSP
Plug 'neovim/nvim-lspconfig'
" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Misc
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" Leader key
let mapleader=","

" Completion
set completeopt=menu,menuone,noselect

lua <<EOF
local cmp = require'cmp'
local lspconfig = require'lspconfig'
local util = require'lspconfig/util'

-- Setup cmp ------------------------------------------------------------------
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
    }, {
        { name = 'buffer' },
        { name = 'path' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- LSP Servers ----------------------------------------------------------------
lspconfig.rust_analyzer.setup{capabilities=capabilities}
lspconfig.zls.setup{capabilities=capabilities}
lspconfig.clangd.setup{capabilities=capabilities}
lspconfig.r_language_server.setup{capabilities=capabilities}
lspconfig.jedi_language_server.setup{capabilities=capabilities}
lspconfig.hls.setup{capabilities=capabilities}
lspconfig.texlab.setup{
    settings = {
        texlab = {
            build = {
                onSave = true,
            },
        },
    },
    capabilities=capabilities
}
lspconfig.jdtls.setup{
    init_options = {
        workspace = util.path.join{vim.loop.os_homedir(), ".cache/jdtls"},
    },
    capabilities=capabilities
}

-- LSP Settings ---------------------------------------------------------------
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = false,
    }
)

-- Treesitter -----------------------------------------------------------------
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
}
EOF

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float({focus = false})

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
if $TERM != "linux"
    set background=light
    set termguicolors
    colorscheme solarized
    let g:airline_theme='solarized'
endif

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
