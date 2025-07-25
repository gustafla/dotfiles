return {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    opts = {},
    keys = {
        {
            "<leader>a",
            function()
                require("tiny-code-action").code_action()
            end,
            desc = "Code action",
        },
    },
}
