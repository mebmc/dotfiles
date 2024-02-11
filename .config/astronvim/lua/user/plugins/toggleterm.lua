-- https://github.com/akinsho/toggleterm.nvim
return {
    "akinsho/toggleterm.nvim",
    event = {
        "VeryLazy",
    },
    cmd = {
        "ToggleTerm",
        "TermExec"
    },
    opts = {
        user_terminals = {}
    },
    config = true
}
