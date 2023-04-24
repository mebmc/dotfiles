-- https://github.com/ray-x/lsp_signature.nvim
return {
    "ray-x/lsp_signature.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    config = function(opts)
        require("lsp_signature").setup(opts)
    end
}
