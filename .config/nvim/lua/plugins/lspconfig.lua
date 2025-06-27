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
    end,
}
