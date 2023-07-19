-- https://github.com/jay-babu/mason-null-ls.nvim
return {
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "jose-elias-alvarez/null-ls.nvim"
    },
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    opts = {
        automatic_installation = true,
        ensure_installed = {
            "black",
            "gitlint",
            "jsonlint",
            "jq",
            "rustfmt",
            -- "semgrep",
            "shellcheck",
            "shfmt",
            -- "stylua",
            "vale",
            "yamllint"
        },
        handlers = {
            semgrep = function(source_name, methods)
                local null_ls = require("null-ls")
                null_ls.register(
                    null_ls.builtins.diagnostics.semgrep.with({
                        args = { "--config", "auto", "-q", "--json", "$FILENAME" },
                        timeout = 30000,
                        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
                    })
                )
            end,
            prettierd = function()
                local null_ls = require "null-ls"
                null_ls.register(
                    null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } }
                )
            end,
        },
    },
}
