-- https://github.com/williamboman/mason-lspconfig.nvim
return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
    },
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    opts = {
        automatic_installation = true,
        ensure_installed = {
            "awk_ls",
            "bashls",
            "cssls",
            "dockerls",
            "gopls",
            "gradle_ls",
            "graphql",
            "hls",
            "html",
            "jsonls",
            "lua_ls",
            "marksman",
            "pyright",
            "robotframework_ls",
            "rome",
            "ruff_lsp",
            "rust_analyzer",
            "solidity",
            "sqlls",
            "tsserver",
            "vimls",
            "yamlls"
        }
    },
    -- config = function()
    --   require("mason").setup()
    --   require("mason-lspconfig").setup()
    -- end
}
