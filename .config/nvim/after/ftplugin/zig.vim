nnoremap <silent> <expr> <leader>m empty(glob("build.zig")) ? '<cmd>!zig build-exe --cache-dir ~/.cache/zig %<CR>' : '<cmd>!zig build<CR>'
nnoremap <silent> <expr> <leader>n empty(glob("build.zig")) ? '<cmd>!zig run --cache-dir ~/.cache/zig %<CR>' : '<cmd>!zig build run<CR>'
nnoremap <silent> <leader>f <cmd>w<CR><cmd>silent !zig fmt %<CR><cmd>e<CR>
