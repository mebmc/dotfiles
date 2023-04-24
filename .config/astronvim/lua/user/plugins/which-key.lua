-- https://github.com/folke/which-key.nvim
return {
    "folke/which-key.nvim",
    opts = {
        mode = "n",
        noremap = true,
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator  = "➜", -- symbol used between a key and it's label
            group      = "", -- symbol prepended to a group
        },
        defaults = {
            ["<leader>f"]     = { name = "󰍉 File/Find" },
            ["<leader>p"]     = { name = "󰏖 Packages" },
            ["<leader>l"]     = { name = " LSP" },
            ["<leader>u"]     = { name = " UI" },
            ["<leader>b"]     = { name = "󰓩 Buffers" },
            ["<leader>bs"]    = { name = "󰒺 Sort Buffers" },
            ["<leader>d"]     = { name = " Debugger" },
            ["<leader>g"]     = { name = "󰊢 Git" },
            ["<leader>t"]     = { name = " Terminal" },
            ["<leader><tab>"] = { name = "󰫍 Tabs" },
            ["<leader>c"]     = { name = " Code" },
            ["<leader>gh"]    = { name = " Hunks" },
            ["<leader>q"]     = { name = "󱂬 Quit/Session" },
            ["<leader>s"]     = { name = " Search" },
            ["<leader>w"]     = { name = " Windows" },
            ["<leader>x"]     = { name = " Diagnostics/Quickfix" },
            ["<leader>k"]     = { name = " User" },
        }
    }
}
