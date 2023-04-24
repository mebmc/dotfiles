-- https://github.com/nvim-treesitter/nvim-treesitter-context
return {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    event = {
        "BufReadPost",
        "BufNewFile"
    },
    opts = {
        mode = "topline"
    }
}
