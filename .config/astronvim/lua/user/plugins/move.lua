-- https://github.com/fedepujol/move.nvim
return {
    "fedepujol/move.nvim",
    cmd = {
        "MoveLine",
        "MoveHChar",
        "MoveWord",
        "MoveBlock",
        "MoveHBlock"
    },
    lazy = false,
    keys = {
        { "<S-Up>",   "<cmd>MoveLine(-1)<CR>",  mode = "n" },
        { "<S-Down>", "<cmd>MoveLine(1)<CR>",   mode = "n" },
        { "<S-Up>",   "<cmd>MoveBlock(-1)<CR>", mode = "x" },
        { "<S-Down>", "<cmd>MoveBlock(1)<CR>",  mode = "x" },
    }
}
