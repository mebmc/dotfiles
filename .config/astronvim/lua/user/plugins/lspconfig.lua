-- https://github.com/neovim/nvim-lspconfig
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim", opts = {} },
        "folke/neodev.nvim",
        "folke/neoconf.nvim",
    },
    opt = {},
    config = function()
        -- Setup neovim lua configuration
        require('neodev').setup()
    end
}
