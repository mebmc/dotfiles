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
            "shellcheck",
            "shfmt",
            "stylua",
            "vale",
            "yamlfix",
            "yamllint"
        }
        -- handlers = {
        --     function(config)
        --         -- Keep original functionality
        --         require('mason-nvim-dap').default_setup(config)
        --     end,
        --     taplo = function()
        --     end, -- disable taplo in null-ls, it's taken care of by lspconfig
        --     prettierd = function()
        --         local null_ls = require "null-ls"
        --         null_ls.register(
        --             null_ls.builtins.formatting.prettierd.with { extra_filetypes = { "markdown", "rmd", "qmd" } }
        --         )
        --     end,
        -- },
    }
}
