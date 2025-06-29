vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.list = true
vim.o.listchars = "tab:>·,trail:·"
vim.o.number = true
vim.o.relativenumber = true
vim.o.spellfile = vim.fn.stdpath("config") .. "/words.utf-8.add"
vim.o.showmode = false
vim.o.termguicolors = true

require("config.lazy")

vim.lsp.enable({
    "bashls",
    "clangd",
    "cmake",
    "glsl_analyzer",
    -- rust_analyzer omitted due to rustaceanvim
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

local close = function()
    if #vim.fn.getbufinfo({ buflisted = 1 }) <= 1 then
        vim.cmd("silent q")
    else
        vim.cmd("silent bd")
    end
end
vim.keymap.set("n", "<leader>h", "<CMD>edit ~/.config/nvim/cheatsheet.md<CR>", { desc = "Open cheatsheet" })
vim.keymap.set("n", "<leader>c", close, { desc = "Close buffer" })
vim.keymap.set("n", "<leader>C", function()
    vim.cmd("w")
    close()
end, { desc = "Write and close buffer" })
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
vim.keymap.set("n", "<F3>", function()
    vim.o.spell = not vim.o.spell
end, { desc = "Toggle spell checking" })
