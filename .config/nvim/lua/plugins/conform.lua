return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black", "isort" },
            rust = { "rustfmt", lsp_format = "fallback" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            c = { "clang-format", lsp_format = "fallback" },
            cpp = { "clang-format", lsp_format = "fallback" },
        },
        formatters = {
            stylua = {
                prepend_args = { "--indent-type", "spaces", "--quote-style", "ForceDouble" },
            },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
