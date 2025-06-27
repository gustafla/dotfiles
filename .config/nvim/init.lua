require("config.lazy")

vim.lsp.enable({
    "bashls",
    "clangd",
    "cmake",
    "glsl_analyzer",
    -- rust_analyzer omitted due to rustaceanvim
    "ltex_plus",
    "lua_ls",
    "texlab",
    "wgsl_analyzer",
    "zls",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "glsl", "lua", "python", "rust", "wgsl", "zig" },
    callback = function()
        vim.treesitter.start()
    end,
})

vim.keymap.set("n", "<leader>h", "<cmd>edit ~/.config/nvim/cheatsheet.md<cr>", { desc = "Open cheatsheet" })
-- vim.keymap.set("n", "<leader>a", function()
--     vim.lsp.buf.code_action()
-- end, { desc = "Code action" })
vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float()
end, { desc = "Show diagnostic" })
vim.keymap.set("n", "gD", function()
    vim.lsp.buf.declaration()
end, { desc = "Go to declaration" })
vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
end, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>/", function()
    require("telescope.builtin").live_grep()
end, { desc = "Live grep (telescope)" })
