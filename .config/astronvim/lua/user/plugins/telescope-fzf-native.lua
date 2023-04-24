-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
return {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    cmd = "Telescope",
    build = "make",
}
