require("config.lazy")

vim.lsp.enable({
    "clangd",
    -- rust-analyzer omitted due to rustaceanvim
    "lua-language-server",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "lua", "python", "rust" },
    callback = function()
        vim.treesitter.start()
    end,
})
