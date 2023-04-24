-- https://github.com/zbirenbaum/copilot.lua
return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
        suggestion = {
            enabled = false
        },
        panel = {
            enabled = false
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
    }
}
