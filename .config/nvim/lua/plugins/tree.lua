return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
    end,
    keys = {
        {
            "<leader>e",
            "<cmd>NvimTreeToggle<cr>",
            desc = "Toggle File Tree",
        },
    },
    opts = {},
}
