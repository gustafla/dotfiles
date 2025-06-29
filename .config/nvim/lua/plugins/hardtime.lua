local notify = function(text)
    require("notify")(text, "warn", {
        title = "Hardtime",
        icon = "🤚",
    })
end

return {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    init = function()
        vim.keymap.set("n", "A<CR>", function()
            notify("Use o instead of A<CR>")
        end)
    end,
    opts = {
        hints = {
            -- Not supported yet, https://github.com/m4xshen/hardtime.nvim/discussions/112
            ["A<CR>"] = {
                message = function()
                    return "Use o instead of A<CR>"
                end,
                length = 2,
            },
        },
        callback = notify,
    },
}
