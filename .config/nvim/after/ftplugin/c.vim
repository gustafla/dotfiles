nnoremap <silent> <leader>f <cmd>w<CR><cmd>silent !clang-format -i --style='{BasedOnStyle: llvm, IndentWidth: 4}' %<CR><cmd>e<CR>
if filereadable("build/build.ninja")
    nnoremap <silent> <leader>m <cmd>!cd build; ninja<CR>
endif
