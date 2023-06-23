-- https://github.com/zbirenbaum/copilot.lua
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
        panel = {
            enabled = false,
            auto_refresh = false,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>"
            },
            layout = {
                position = "bottom", -- | top | left | right
                ratio = 0.4
            },
        },
        suggestion = {
            enabled = true,
            auto_trigger = false,
            debounce = 75,
            keymap = {
                accept = "<Tab>",
                accept_word = false,
                accept_line = false,
                next = "<C-e>",
                prev = "<C-w>",
                dismiss = "<C-]>",
            },
        },
        filetypes = {
            yaml      = false,
            markdown  = false,
            help      = false,
            gitcommit = true,
            gitrebase = false,
            hgcommit  = false,
            svn       = false,
            cvs       = false,
            ["*"]     = true,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
    }
}
