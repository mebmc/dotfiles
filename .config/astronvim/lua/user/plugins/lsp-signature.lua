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
    opts = {
        hint_enable = false,
        hint_prefix = ""
    },
    -- config = function(_, opts)
    --     require("lsp_signature").setup(opts)
    -- end
}
