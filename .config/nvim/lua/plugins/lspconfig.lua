return {
    "neovim/nvim-lspconfig",
    init = function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = "LuaJIT",
                    path = {
                        "lua/?.lua",
                        "lua/?/init.lua",
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                        },
                    },
                },
            },
        })
        vim.lsp.config("texlab", {
            settings = {
                texlab = {
                    build = {
                        onSave = true,
                    },
                },
            },
        })
        vim.lsp.config("ltex_plus", {
            filetypes = { "tex" },
        })
    end,
}
