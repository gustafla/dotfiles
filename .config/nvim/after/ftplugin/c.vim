nnoremap <silent> <leader>f <cmd>w<CR><cmd>silent !clang-format -i --style='{BasedOnStyle: llvm, IndentWidth: 4}' %<CR><cmd>e<CR>
