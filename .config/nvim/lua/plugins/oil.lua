return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        keymaps = {
            ["<ESC>"] = { "actions.close", mode = "n" },
        },
    },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
        {
            "<leader>e",
            "<CMD>Oil .<CR>",
            desc = "File explorer",
        },
    },
}
