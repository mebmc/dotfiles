-- https://github.com/akinsho/toggleterm.nvim
return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    cmd = {
        "ToggleTerm",
        "TermExec"
    },
    opts = {
        user_terminals = {}
    },
    config = true
}
