nnoremap <silent> <leader>f <cmd>w<CR><cmd>silent !muon fmt_unstable -i %<CR><cmd>e<CR>
nnoremap <silent> <leader>m <cmd>!muon setup build && samu -C build -t compdb -x c_COMPILER cpp_COMPILER > compile_commands.json<CR>
