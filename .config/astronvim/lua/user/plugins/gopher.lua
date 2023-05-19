-- https://github.com/olexsmir/gopher.nvim
return {
    "olexsmir/gopher.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    build = function()
        vim.cmd [[silent! GoINstallDeps]]
    end
}
