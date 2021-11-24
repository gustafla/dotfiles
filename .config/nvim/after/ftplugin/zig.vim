nnoremap <silent> <expr> <leader>m empty(glob("build.zig")) ? '<cmd>!zig build-exe %<CR>' : '<cmd>!zig build<CR>'
nnoremap <silent> <expr> <leader>n empty(glob("build.zig")) ? '<cmd>!zig run %<CR>' : '<cmd>!zig build run<CR>'
nnoremap <silent> <leader>f <cmd>w<CR><cmd>silent !zig fmt %<CR><cmd>e<CR>
