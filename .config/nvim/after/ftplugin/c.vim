let clangfmtargs=""
if !filereadable(".clang-format")
    let clangfmtargs = "--style='{BasedOnStyle: llvm, IndentWidth: 4}'"
endif
nnoremap <silent> <leader>f <cmd>w<CR><cmd>silent execute '!clang-format -i ' . clangfmtargs . ' %'<CR><cmd>e<CR>
if filereadable("build/build.ninja")
    nnoremap <silent> <leader>m <cmd>!samu -C build<CR>
endif

